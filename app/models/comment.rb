class Comment < ApplicationRecord
  belongs_to :offer, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: { minimum: 5 , maximum: 100 }
end
