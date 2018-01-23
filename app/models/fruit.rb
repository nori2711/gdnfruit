class Fruit < ActiveRecord::Base
  belongs_to :user
  has_many :harvests
  has_many :members, through: :harvests
  has_many :reviews, through: :harvests

  has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :photo,content_type: ["image/jpg","image/jpeg","imege/png"]
end
