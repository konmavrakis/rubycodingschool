# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
SKROUTZ_CLIENT_SECRET =Rails.application.secrets.skroutz_client_id
SKROUTZ_CLIENT_SECRET = Rails.application.secrets.skroutz_client_secret