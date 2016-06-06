class Restaurant < ActiveRecord::Base
  validates :name, :cuisine, :city, :state, :zip, presence: true

  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
  belongs_to :user
end
