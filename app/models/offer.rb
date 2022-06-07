require 'date'

class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :supplier
  has_many :orders, dependent: :delete_all

  has_many :participants, through: :orders, source: :user
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :orders

  has_one_attached :photo
  validates :name, presence: true, length: { minimum: 10 , maximum: 40 }
  validates :description, presence: true, length: { minimum: 50 , maximum: 200 }
  validates :initial_price, presence: true
  validates :target_price, presence: true, numericality: { less_than: :initial_price }
  validates :target_amount, presence: true, numericality: { only_integer: true, greater_than: 1}
  validates :supplier_offer_url, presence: true
  validates :category, presence: true, inclusion: { in: %w(Furniture Textiles Decoration Kitchenware\ &\ Dinnerware Take\ away Pots\ &\ plants Outdoor) }
  validates :deadline, presence: true
  validate :deadline_cannot_be_in_the_past
  validates :status, inclusion: { in: %w(active accomplished expired)}

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end

  def ordered_amount
    orders.reduce(0) { |sum, order| sum + order.amount }
  end

  def days_until_deadline
    days = (deadline.to_datetime - Date.today).to_i
    if days == 1
      return "in #{days} day"
    elsif days == 0
      return "today"
    else
      return "in #{days} days"
    end
  end

  def progress_percentage
    (ordered_amount / target_amount.to_f)*100
  end

  def target_reached?
    ordered_amount >= target_amount
  end

  def active?
    status == "active"
  end
end
