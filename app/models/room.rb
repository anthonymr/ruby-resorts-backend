class Room < ApplicationRecord
  has_one_attached :image
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 55 }
  validates :description, presence: true, length: { maximum: 55 }
  validates :full_price, presence: true, numericality: { greater_than: 0 }
  validates :reservation_price, presence: true, numericality: { greater_than: 0 }
  validates :reservation_fee, presence: true, numericality: { greater_than: 0 }
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :image, presence: true
end
