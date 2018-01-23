class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :fruits
  has_many :members
  # has_many :harvests
  has_many :harvests, through: :members
  has_many :reviews
end
