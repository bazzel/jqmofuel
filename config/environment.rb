# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Jqmofuel::Application.initialize!

# I could have used:
#  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
# but I wanted one place to define this environment-dependent setting, so:
ActionMailer::Base.default_url_options = { :host => App.host }