class Fruit < ActiveRecord::Base
  belongs_to :user
  has_many :harvests
  has_many :members, through: :harvests
  has_many :reviews, through: :harvests

# geocodingをするために果樹の住所カラムを集約
# "%s %s"にて配列を受け取り
  def fruit_address
    "%s %s"%([self.fruit_address2,self.fruit_address3])
  end

# fruit_addressが更新された時にgeocoding実行
  geocoded_by :fruit_address
  after_validation :geocode

  mount_uploader :photo, PhotoUploader
end
