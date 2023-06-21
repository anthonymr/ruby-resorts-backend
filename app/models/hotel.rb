class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
  validates :city, presence: true, length: { minimum: 3, maximum: 55 }
end
