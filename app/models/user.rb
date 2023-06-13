class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def admin?
    role == 'admin'
  end
end
