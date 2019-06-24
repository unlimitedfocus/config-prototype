source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'semantic-ui-sass'

gem 'devise'
gem 'net-ldap'
# gem 'devise-jwt'
# gem 'rack-cors'
# gem 'route_translator'
# gem 'kaminari'
# gem 'ransack'
# gem 'foreman'
# gem 'json-schema'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# gem 'elastic-apm' # https://github.com/elastic/apm-agent-ruby

gem 'paranoia'

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry'
  gem "pry-rails"
  gem "pry-byebug"
  gem "awesome_print"
  # gem "pry-stack_explorer"
  # gem "pry-doc"
  # gem "binding_of_caller"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard'
  gem 'guard-minitest'
  gem 'terminal-notifier-guard'
  gem 'annotate'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'factory_bot_rails'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
