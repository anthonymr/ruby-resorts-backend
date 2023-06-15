class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :hotel_id, presence: true

  def calculate_amount!
    new_record? ? self.amount = calculate_amount : update(amount: calculate_amount)
  end

  def calculate_amount
    room = Room.find_by(id: room_id)
    room.reservation_price.present? ? (end_date - start_date).to_i * room.reservation_price : 0
  end

  def with_child_data
    attributes.merge(
      hotel: hotel.attributes.except('created_at', 'updated_at'),
      room: room.attributes.except('created_at', 'updated_at'),
      user: user.attributes.except('created_at', 'updated_at', 'password_digest', 'password')
    )
  end
end
