class Tree < ActiveRecord::Base
  has_many :requests
  belongs_to :govermment, foreign_key: 'organ_id',primary_key: 'organ_id'
end
