class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # For localisation User
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :conversations
  # Validates conditions
  validates :username, length: { minimum: 5 }
  # Media rattached
  has_one_attached :photo
end
