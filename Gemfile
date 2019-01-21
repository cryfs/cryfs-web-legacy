source 'https://rubygems.org'
ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.6.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1.20'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# For heroku
group :production do
  gem 'puma', '~> 3.12.0'
  gem 'puma-heroku', '~> 1.0.0'
  gem 'heroku-deflater', '~> 0.6.3'
  gem 'image_optim', '~> 0.26.3'
  gem 'image_optim_pack', '~> 0.5.1.20190105'
  gem 'image_optim_rails', '~> 0.4.1'
end

# Newrelic Monitoring
group :production do
  gem 'newrelic_rpm'
end

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.3'
gem 'jquery-turbolinks', '~> 2.1.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.8.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.0.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.11'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.4.0'

gem 'slim-rails', '~> 3.2.0'

gem 'font-awesome-sass', '~> 4.7.0'

gem 'mail_form', '~> 1.7.1'
gem 'validates_email_format_of' , '~> 1.6.3'

gem 'staccato', '~> 0.5.1'

gem 'mailchimp-api', '~> 2.0.6'

group :development do
  gem 'guard-livereload', '~> 2.5.2', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.7.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 10.0.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
end
