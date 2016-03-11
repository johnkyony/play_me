ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"
require "minitest/spec"

require 'minitest/reporters'
reporter_options = { color: true}
Minitest::Reporters.use!( Minitest::Reporters::DefaultReporter.new(reporter_options), ENV, Minitest.backtrace_filter )

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user)
    visit  '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'topsecret'
    click_button "Sign in"
  end

end

#Capybara driver
Capybara.javascript_driver = :webkit

