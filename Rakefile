require 'bundler/setup'
require 'torquebox-rake-support' if RUBY_PLATFORM == 'java'
require 'torquebox-remote-deployer' if RUBY_PLATFORM == 'java' and ENV['RACK_ENV'] == 'development'

Dir[File.join(File.dirname(__FILE__), 'tasks/*.rake')].each { |f| load f }

task :default => [:spec]

desc "Run specs"
task :spec do
  require 'rspec/core/rake_task'
  require 'rspec/core/version'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = './spec/**/*_spec.rb'
  end
end
