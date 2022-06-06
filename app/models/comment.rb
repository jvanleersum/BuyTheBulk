class Comment < ApplicationRecord
  belongs_to :offer, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
end
