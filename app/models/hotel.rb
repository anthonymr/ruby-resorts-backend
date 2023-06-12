class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    has_many :users, through: :bookings
    
    validates :name, presence: true
    validates :city, presence: true
end
