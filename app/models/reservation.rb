class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room
  validates :start_date, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/, message: 'Format: YYYY-MM-DD' }
  validates :end_date, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/, message: 'Format: YYYY-MM-DD' }
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today, message: 'Must be greater than today' }
  validates :end_date, comparison: { greater_than: :start_date, message: 'Must be greater than start date' }
  validates :room_id, presence: true
  validates :hotel_id, presence: true

  def calculate_amount!
    new_record? ? self.amount = calculate_amount : update(amount: calculate_amount)
  end

  def calculate_amount
    return 0 unless start_date.present? && end_date.present? && room_id.present?

    room = Room.find_by(id: room_id)
    room.reservation_price.present? ? (end_date - start_date).to_i * room.reservation_price : 0
  end

  def with_associations_data
    attributes.merge(
      hotel: hotel.attributes.except('created_at', 'updated_at'),
      room: room.attributes.except('created_at', 'updated_at'),
      user: user.attributes.except('created_at', 'updated_at', 'password_digest', 'password')
    )
  end

  def self.new_with_amount(params)
    reservation = new(params)
    reservation.user_id = Current.user.id
    reservation.calculate_amount!
    reservation
  end
end
