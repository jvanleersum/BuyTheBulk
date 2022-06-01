class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :orders
  has_many :participants, through: :orders, source: :users
  has_many :comments

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 10 , maximum: 40 }
  validates :description, presence: true, length: { minimum: 50 , maximum: 200 }
  validates :initial_price, presence: true
  validates :target_price, presence: true, numericality: { less_than: :initial_price }
  validates :target_amount, presence: true, numericality: { only_integer: true, greater_than: 1}
  validates :supplier_offer_url, presence: true
  validates :category, presence: true, inclusion: { in: %w(furniture textiles decoration kitchenware\ &\ dinnerware take\ away pots\ &\ plants outdoor) }
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end
end
