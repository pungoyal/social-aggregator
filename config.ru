require 'bundler'
Bundler.require

$: << File.dirname(__FILE__)

ENV['RACK_ENV'] ||= 'development'

require 'social_aggregator'
run SocialAggregator::App
