require_relative './controller_macros'
require_relative './devise_request_spec_helpers'

RSpec.configure do |config|
  config.include DeviseRequestSpecHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end
