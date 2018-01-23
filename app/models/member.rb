class Member < ActiveRecord::Base
  belongs_to :harvest, counter_cache: true
  belongs_to :user
  delegate :fruit, to: :harvest
end
