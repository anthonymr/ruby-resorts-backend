class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :hotel_id, presence: true

  def calculate_amount
    room = Room.find_by(id: room_id)
    return 0 unless room

    (end_date - start_date).to_i * room.reservation_price
  end
end
