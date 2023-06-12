class RoomsController < ApplicationController
  def index
    rooms = Room.all.with_attached_image
    render json: rooms, status: 200
  end

  def show
    render json: room, status: 200
  rescue ActiveRecord::RecordNotFound
    not_found('Room')
  end

  def create
    if @current_user.admin?
      room = Room.new(room_params)
      if room.save
        render json: room, status: 201
      else
        render json: { errors: room.errors.full_messages }, status: 400
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
    params.permit(:name, :description, :full_price, :reservation_price, :reservation_fee, :rating, :image)
  end

  def room
    @room ||= Room.find(params[:id])
  end
end