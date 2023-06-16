class RoomsController < ApplicationController
  include ActiveStorage::SetCurrent

  def index
    rooms = Room.all.with_attached_image.map do |room|
      room.as_json_with_image(url_for(room.image), full_data: false)
    end

    render json: rooms, status: 200
  end

  def show
    render json: room.as_json_with_image(url_for(room.image)), status: 200
  rescue ActiveRecord::RecordNotFound
    not_found('Room')
  end

  def create
    return forbidden unless Current.user.admin?

    new_room = Room.new_with_image(room_params, params[:image])

    if new_room.save
      render json: new_room.as_json_with_image(url_for(new_room.image)), status: 201
    else
      render json: { errors: new_room.errors.full_messages }, status: 400
    end
  end

  def destroy
    return forbidden unless Current.user.admin?

    room.destroy
    render json: room, status: 200
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
