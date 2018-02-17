class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :tree

  befere_create :send_request_to_create

  def send_request_to_create
    NotificationMailer.send_confirm_to_request(self).deliver
  end
end
