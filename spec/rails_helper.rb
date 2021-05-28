require 'simplecov'
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'shoulda/matchers'
require "capybara/rspec"
require "database_cleaner"
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.after do |example|
    if example.metadata[:type] == :feature
      save_and_open_screenshot
    end
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = :selenium_chrome

  Capybara.configure do |config|
    config.default_max_wait_time = 10 #seconds
    config.default_driver = :selenium
    # config.always_include_port = true
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
