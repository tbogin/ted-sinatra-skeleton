class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
  belongs_to :user
end
