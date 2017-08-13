source 'https://rubygems.org'

# Ruby version
ruby "2.2.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Twitter Bootstrap
gem 'therubyracer'
gem 'less-rails' # Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

# Devise gem for user registration etc.
gem 'devise'

# Upload of pics
gem 'carrierwave'

# Kaminari gem
gem 'kaminari'

# foreign key
gem 'foreigner', '~> 1.7.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
end

group :production, :staging do
	gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara-webkit', '~> 1.6.0'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'byebug'
end

group :test do
  gem 'simplecov', :require => false
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end
