class Conversation < ApplicationRecord
  belongs_to :skatespot
  validates :content, length: { minimum: 5 }
end
