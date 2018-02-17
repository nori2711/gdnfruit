class NotificationMailer < ActionMailer::Base
  default from: "Town Fruits運営事務局"

  def send_confirm_to_request(request)
    @request = request
    mail(
      subject: "収穫イベントをリクエストします",
      to: @request.tree.government.hall_email,
    ) do |format|
      format.text
    end
  end
end
