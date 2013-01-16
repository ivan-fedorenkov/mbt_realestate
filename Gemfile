source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'sqlite3', :group => [:test, :development]
gem 'pg', :group => :production
gem 'newrelic_rpm', :group => :production

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
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
  gem 'rb-inotify', '~> 0.8.8'
  gem 'guard'
  gem 'spork', '~> 1.0rc'
  gem 'guard-spork'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.12.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'

gem 'jquery-rails'
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'
gem 'bootstrap-wysihtml5-rails'
gem 'haml'
gem "factory_girl_rails", "~> 4.0"
gem 'faker'
gem 'rails-i18n'
gem 'devise'
gem 'paperclip', "~> 3.0"
gem 'paperclip-dropbox', "~> 1.1.1"
