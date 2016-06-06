class Review < ActiveRecord::Base
  validates :rating, :body, presence: true

  belongs_to :user
  belongs_to :restaurant
end
