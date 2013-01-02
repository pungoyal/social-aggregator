require 'bundler'
Bundler.require :default, :test

ENV['RACK_ENV'] ||= 'test'
require 'sinatra/contrib'

spec_root = File.expand_path(File.dirname(__FILE__))
$: << spec_root
$: << File.expand_path(File.join(File.dirname(__FILE__), '..'))

Sinatra::Base.set :environment, :test
require File.join(File.dirname(__FILE__), '..', 'social_aggregator')
Dir[File.join(spec_root, "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
  config.include Mongoid::Matchers
  config.include Sinatra::TestHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
