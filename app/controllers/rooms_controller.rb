class RoomsController < ApplicationController
  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  def index
    rooms = Room.all.with_attached_image.map do |room|
      room.image.attached? ? room.as_json.merge(image: url_for(room.image)) : room.as_json
    end

    render json: rooms, status: 200
  end

  def show
    room_to_show = room.as_json
    room_to_show = room_to_show.merge(image: url_for(room.image)) if room.image.attached?

    render json: room_to_show, status: 200
  rescue ActiveRecord::RecordNotFound
    not_found('Room')
  end

  def create
    if @current_user.admin?
      new_room = Room.new(room_params.except(:image))
      decoded_data = Base64.decode64(params[:image].split(',')[1])

      new_room.image = {
        io: StringIO.new(decoded_data),
        content_type: 'image/png',
        filename: 'image.png'
      }

      if new_room.save
        render json: new_room, status: 201
      else
        render json: { errors: new_room.errors.full_messages }, status: 400
      end

      return
    end

    forbidden
  end

  def destroy
    if @current_user.admin?
      room.destroy
      render json: room, status: 200
      return
    end

    forbidden
  rescue ActiveRecord::RecordNotFound
    not_found('Room')
  end

  private

  def room_params
    params.require(:room).permit(
      :name,
      :description,
      :full_price,
      :reservation_price,
      :reservation_fee,
      :rating,
      :image
    )
  end

  def room
    @room ||= Room.with_attached_image.find(params[:id])
  end
end
