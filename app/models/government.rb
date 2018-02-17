class Government < ActiveRecord::Base
  has_many :trees, foreign_key: 'organ_id', primary_key: 'organ_id'
end
