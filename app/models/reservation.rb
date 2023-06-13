class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room

  def calculate_amount
    (end_date - start_date).to_i * room.reservation_price
  end
end
