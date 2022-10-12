class UserMailer < ApplicationMailer
  default from: 'notifications@localhost.com'


  def acknowledgement_email(user)
    @user = user 
    @url  = 'http://localhost:3000/my_portfolio'
    mail(to: @user.email, subject: 'Welcome to Stock Tracker')
  end
end
