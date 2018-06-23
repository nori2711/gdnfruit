class Fruit < ActiveRecord::Base
  belongs_to :user
  has_many :harvests
  has_many :members, through: :harvests
  has_many :reviews, through: :harvests

  has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :photo,content_type: ["image/jpg","image/jpeg","imege/png"]

# geocodingをするために果樹の住所カラムを集約
# "%s %s"にて配列を受け取り
  def fruit_address
    "%s %s"%([self.fruit_address2,self.fruit_address3])
  end

# fruit_addressが更新された時にgeocoding実行
  geocoded_by :fruit_address
  after_validation :geocode
end
