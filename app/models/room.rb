class Room < ApplicationRecord
  has_one_attached :image
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 55 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :full_price, presence: true, numericality: { greater_than: 0 }
  validates :reservation_price, presence: true, numericality: { greater_than: 0 }
  validates :reservation_fee, presence: true, numericality: { greater_than: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :image, presence: true

  def with_image(image_url, full_data: true)
    return as_json unless image.attached?
    return as_json.merge(image_url:) unless full_data

    as_json(only: %i[id name description]).merge(image_url:)
  end

  def self.new_with_image(room_params, image)
    return Room.new(room_params.except(:image)) unless image.present?

    new_room = Room.new(room_params.except(:image))
    decoded_data = Base64.decode64(image.split(',')[1])

    new_room.image = {
      io: StringIO.new(decoded_data),
      content_type: 'image/png',
      filename: 'image.png'
    }

    new_room
  end
end
