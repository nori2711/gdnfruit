class Harvest < ActiveRecord::Base
  belongs_to :fruit
  has_many :members
  # belongs_to :user
  has_many :users, through: :members
  has_many :reviews
end
