class Order < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
