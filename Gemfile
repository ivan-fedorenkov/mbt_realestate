source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'sqlite3', :group => [:test, :development]
gem 'pg', :group => :production
gem 'newrelic_rpm', :group => :production

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'dynamic_form'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
end

group :development do
  gem 'guard'
  gem 'spork', '~> 1.0rc'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test, :development do
  gem 'rspec-rails', '~> 2.12.2'
  # To use debugger
  # gem 'debugger'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use thin as the app server
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'


gem 'jquery-rails'
gem 'bootstrap-sass', '~> 2.0.4.2'
gem 'bootstrap-wysihtml5-rails'
gem 'haml'
gem "factory_girl_rails", "~> 4.0"
gem 'faker'
gem 'rails-i18n'
gem 'devise'
gem 'paperclip', "~> 3.0"
gem 'aws-sdk'
