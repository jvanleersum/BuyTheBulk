class Business < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 4 , maximum: 15 }
  validates :description, presence: true, length: { minimum: 50 , maximum: 350 }
  validates :address, presence: true
  validates :name, presence: true
end
