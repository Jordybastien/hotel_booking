require 'tripletex_ruby_client'
require 'net/http'

TripletexRubyClient.configure do |config|
  config.consumer_token = ENV["TT_CONSUMER_TOKEN"]
  config.employee_token = ENV["TT_EMPLOYEE_TOKEN"]
  config.host = Rails.env.production? ? 'https://tripletex.no' : 'https://api.tripletex.io'
  config.token_expiration_time = Rails.env.production? ? 1.month : 1.day
  if ENV["TT_DEBUG_ENABLE"]
    config.debugging = true
    config.logger == ActiveSupport::Logger.new($stdout)
  end
end
