ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/poltergeist'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  # Enable authenticating users in test modes, issues with Devise::TestHelper in Rails 4, use Warden instead
  include Warden::Test::Helpers
  Warden.test_mode!

  # Logout after each test
  config.after(:each, :type => :feature) do
    logout(:user)
  end

  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

Capybara.javascript_driver = :poltergeist
