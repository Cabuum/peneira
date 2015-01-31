ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'

SimpleCov.configure do
  coverage_dir File.join('.', 'tmp', 'code_analysis', 'coverage')
end

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Loading forgeries from a custom path
Forgery.load_from! "#{Forgery.rails_root}/spec/support/forgery"

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Include Warden::Test::Helpers is necessary to call the login_as method here inside spec helper file
include Warden::Test::Helpers
Warden.test_mode!

Capybara.default_wait_time = 5

# Set the javascript driver to use PhantomJS
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true, js_errors: false, debug: false)
end

Capybara.javascript_driver = :poltergeist

# Keep up to the number of screenshots specified in the hash
Capybara::Screenshot.prune_strategy = { keep: 20 }

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  # config.after(:each) { Warden.test_reset! }

  # config.before(:each) do | example |
  #   # Clears out the jobs for tests using the fake testing
  #   Sidekiq::Worker.clear_all

  #   if example.metadata[:sidekiq] == :fake
  #     Sidekiq::Testing.fake!
  #   elsif example.metadata[:sidekiq] == :inline
  #     Sidekiq::Testing.inline!
  #   elsif example.metadata[:type] == :feature
  #     Sidekiq::Testing.inline!
  #   else
  #     Sidekiq::Testing.fake!
  #   end
  # end

  # Remove verbose methods from this hot girl
  config.include FactoryGirl::Syntax::Methods

  # Include Devise methods to the specs
  config.include Devise::TestHelpers, type: :controller

  # config.before(:each) do
  #   @current_user = FactoryGirl.create(:user)
  #   login_as @current_user

  #   User.current = @current_user
  # end

  #config.before(:each) do
  #  @collaborator = FactoryGirl.create(:collaborator)
  #  login_as @collaborator
  #end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Raise any error when dreprected function was found
  config.raise_errors_for_deprecations!
end

