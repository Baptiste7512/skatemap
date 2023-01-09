class Article < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true
  validates :content, presence: true
  # validates :password, presence: true
end
