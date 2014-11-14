# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Task1::Application.initialize!
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app30998998@heroku.com'],
  :password       => ENV['gbndq9mt'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
