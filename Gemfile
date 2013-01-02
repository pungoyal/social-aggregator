source :rubygems

ruby '1.9.3'

gem 'rake'

gem "sinatra"
gem "sinatra-contrib"

gem "mongoid"

gem "omniauth"
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-linkedin'

gem 'pry'

platforms :jruby do
  gem "jruby-openssl"

  gem 'torquebox-server', group: :development
  gem 'torquebox-rake-support'
end

platforms :mri do
  gem 'thin'
  gem 'torquebox-no-op'
end

group :development do
  gem 'sinatra-reloader'
  gem 'foreman'
end

group :test do
  gem 'mongoid-rspec'
  gem 'rack-test', :require => 'rack/test'
  gem 'database_cleaner'
  gem 'factory_girl'

  gem 'vcr'
  gem 'fakeweb'
  gem 'factory_girl'
end
