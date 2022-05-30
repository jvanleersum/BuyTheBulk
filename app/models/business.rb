class Business < ApplicationRecord
  has_one :user, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true, length: { minimum: 4 , maximum: 20 }
  validates :description, presence: true, length: { minimum: 50 , maximum: 200 }
  validates :address, presence: true
  validates :name, presence: true
end
