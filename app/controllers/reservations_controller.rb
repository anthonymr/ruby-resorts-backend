class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def index
    reservations = Current.user.reservations.includes(:user, :hotel, :room).all
    reservations = reservations.map(&:with_associations_data)
    render json: reservations, status: 200
  end

  def show
    return forbidden unless Current.user.id == @reservation.user_id

    render json: @reservation.with_associations_data, status: 200
  rescue ActiveRecord::RecordNotFound
    not_found('Reservation')
  end

  def create
    reservation = Reservation.new_with_amount(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return forbidden unless Current.user.id == @reservation.user_id

    @reservation.destroy
    render json: @reservation, status: 200
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    return forbidden unless Current.user.id == @reservation.user_id
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reservation not found' }, status: :not_found
  end

  def reservation_params
    params.permit(:start_date, :end_date, :hotel_id, :room_id)
  end
end
