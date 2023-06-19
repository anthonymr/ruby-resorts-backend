class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 55 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { minimum: 5, maximum: 55 }
  validates :password, presence: true, length: { minimum: 6, maximum: 55 }, on: :create

  def admin?
    role == 'admin'
  end
end
