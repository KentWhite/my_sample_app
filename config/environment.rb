# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MySampleApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "sendgrid.net",
  :authentication => :login,
  :user_name => "SeecaMailer@smtp.sendgrid.net",
  :password => "s56cat78ch"
}