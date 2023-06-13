class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
end
