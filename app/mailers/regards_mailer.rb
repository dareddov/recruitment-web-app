class RegardsMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_regards_email(recipient, sender)
    @user = recipient
    @sender = sender
    mail(to: @user.email, subject: t('.subject'))
  end
end
