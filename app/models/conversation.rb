class Conversation < ApplicationRecord
  belongs_to :skatespot
  belongs_to :user
  validates :content, length: { minimum: 5 }
end
