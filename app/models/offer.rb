class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :orders
  has_many :participants, through: :orders, source: :users
  has_many :comments
end
