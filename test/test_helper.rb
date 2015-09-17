Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: users(user).email
  fill_in "Password", with: "password"
  click_on "Log in"
end

system 'rubocop'
