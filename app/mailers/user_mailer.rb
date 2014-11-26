class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to ')
  end

  def password_changed id
    @user = User.find(id)
    mail to: @user.email, subject: "Your password has changed"
  end

end
