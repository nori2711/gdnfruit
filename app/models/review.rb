class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :harvest
  delegate :fruit, to: :harvest
end
