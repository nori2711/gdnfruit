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

  after_create :send_user_to_create

  def send_user_to_create
    NotificationMailer.send_confirm_to_user(self).deliver
  end


end
