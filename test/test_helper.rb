ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require_relative '../config/environment'
require 'rails/test_help'

require 'database_cleaner'
require 'database_cleaner_support'

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include DatabaseCleanerSupport
  include FactoryBot::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # ...

  include DatabaseCleanerSupport

  # ...
end

