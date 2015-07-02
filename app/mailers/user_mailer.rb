class UserMailer < ActionMailer::Base
  default from: "zdubzdab@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://zdubzdab@gmail.com/login'
    mail(to: @user.email, subject: 'Welcome to ')
  end

end
