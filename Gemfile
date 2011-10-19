source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'mysql2'
gem 'omniauth'
gem 'haml'
gem 'simple_form'
gem 'workflow'
gem 'cancan'
gem 'paper_trail', '~> 2'
gem 'carrierwave'
gem 'delayed_job'


# Not needed for now
#gem 'sunspot', '1.2.rc4'
#gem 'sunspot_rails', '1.2.rc4'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'seedbed'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'turn', :require => false
  gem "rspec-rails"
  gem "rspec-core"
  gem "database_cleaner"
  gem 'factory_girl_rails'
  gem "shoulda"
  gem "remarkable_date_validator"
  gem "timecop"
  gem "faker"
  gem "webmock"
end
