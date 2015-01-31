source 'https://rubygems.org'
source 'https://rails-assets.org'

# ruby '2.2.0'

gem 'rails', '4.2.0'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks'

gem 'bootstrap-sass', '~> 3.3.1.0'
gem 'autoprefixer-rails', '~> 4.0.2.2'

gem 'simple_form', '~> 3.1.0'

gem 'enumerate_it', '~> 1.2.3'
gem 'pg', '~> 0.18.1'

gem 'devise', :git => 'https://github.com/plataformatec/devise.git', :branch => 'lm-rails-4-2'
gem 'devise-i18n-views', '~> 0.3.3'

gem 'kaminari'

gem 'carrierwave'
gem 'rmagick'
gem 'country_select'

gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-facebook'

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'capistrano-rails'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-migrate'

  gem 'rspec-rails', '~> 3.1.0'
  gem 'shoulda-matchers', '~> 2.7.0'
  gem 'fuubar', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'capybara-screenshot', '~> 1.0.4'
  gem 'poltergeist', '~> 1.5.1'

  gem 'launchy', '~> 2.4.3'
  gem 'database_cleaner', '~> 1.4.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'forgery', '~> 0.6.0'

  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
end

group :production do
  gem 'rails_12factor'
end
