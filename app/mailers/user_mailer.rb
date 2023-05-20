class UserMailer < ApplicationMailer

  default template_path: 'mailer/user/mailer'

  def send_password(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Welcome Mail')
  end

end
