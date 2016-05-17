class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :update
  validates :password, presence: true, on: :create

  has_many :reviews
  has_many :restaurants
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
end
