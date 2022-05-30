class User < ApplicationRecord
  belongs_to :business
  has_many :comments
  has_many :orders
  has_many :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
