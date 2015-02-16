require "simplecov"
SimpleCov.start do
  add_filter "/factories/"
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'
require 'factory_girl_rails'
require 'support/factory_girl'
require 'database_cleaner'

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods

  def setup
    DatabaseCleaner.start
  end

  def teardown
    reset_session!
    DatabaseCleaner.clean
  end

end
