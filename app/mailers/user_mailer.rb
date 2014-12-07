class UserMailer < ActionMailer::Base
  default from: "zdubzdab@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.google.com'
    mail(to: @user.email, subject: 'Welcome to ')
  end

  def password_changed id
    @user = User.find(id)
    mail to: @user.email, subject: "Your password has changed"
  end

end
