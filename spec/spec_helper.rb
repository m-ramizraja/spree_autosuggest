if ENV['COVERAGE']
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_filter '/spec/'
    add_group 'Controllers', 'app/controllers'
    add_group 'Overrides', 'app/overrides'
    add_group 'Models', 'app/models'
    add_group 'Libraries', 'lib'
  end
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/webkit'
require 'shoulda-matchers'
require 'i18n-spec'
require 'ffaker'
require 'database_cleaner'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/bar_ability'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests
  config.include SuggestionHelpers

  config.extend Spree::TestingSupport::AuthorizationHelpers::Request, type: :feature

  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  # Ramiz : Capybara::Webkit::InvalidResponseError:
  # SYNTAX_ERR: DOM Exception 12
  # Following method fix this error.
  Capybara.add_selector(:row) do
    xpath { |num| ".//tbody/tr[#{num}]" }
  end

  Capybara.javascript_driver = :webkit
end
