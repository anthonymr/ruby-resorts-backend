class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def index
    reservations = @current_user.reservations.includes(:user, :hotel, :room).all

    reservations = reservations.map(&:with_child_data)

    render json: reservations, status: 200
  end

  def show
    render json: @reservation.with_child_data, status: 200
  rescue ActiveRecord::RecordNotFound
    not_found('Reservation')
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user_id = @current_user.id
    reservation.calculate_amount!
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    render json: @reservation, status: 200
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    return forbidden unless @current_user.id == @reservation.user_id
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reservation not found' }, status: :not_found
  end

  def reservation_params
    params.permit(:start_date, :end_date, :hotel_id, :room_id)
  end
end
