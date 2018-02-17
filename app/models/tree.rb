class Tree < ActiveRecord::Base
  has_many :requests
  belongs_to :government, foreign_key: 'organ_id',primary_key: 'organ_id'
end
