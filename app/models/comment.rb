class Comment < ApplicationRecord
  belongs_to :offer, dependent: :destroy
  belongs_to :user
end
