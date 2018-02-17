class NotificationMailer < ActionMailer::Base
  default from: "Garden Fruits運営事務局"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "会員登録が完了しました",
      to: @user.email
    ) do |format|
      format.text
    end
  end
end
