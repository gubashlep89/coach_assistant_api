source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

## CORE
gem 'bootsnap', '>= 1.4.2', require: false
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

# Use Puma as the app server
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'redis-actionpack', '5.2.0'
gem 'redis-store', '1.5.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

## Database
gem 'pg', '>= 0.18', '< 2.0'
gem 'strong_migrations', '0.7.1'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

## Serialization
gem 'jb', '0.8.0'

## Utility
gem 'config', '2.2.3'

## Swagger UI
gem 'rswag-api'
gem 'rswag-ui'

gem 'awesome_print', '1.8.0'
# Reduces boot times through caching; required in config/boot.rb

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

##  Auth
gem 'devise', '4.7.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'guard-rspec', require: false
  gem 'rspec-rails'

  # rails swagger api gem
  gem 'rswag-specs'

  # rubocop
  gem 'rubocop'
  gem 'rubocop-github'

  ## UTIL
  gem 'annotate', '3.1.1'
  gem 'webmock', '3.8.3'

  # Audit
  gem 'brakeman'
  gem 'bundler-audit'
end

group :development do
  gem 'bullet'
  gem 'letter_opener'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
