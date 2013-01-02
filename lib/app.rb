module SocialAggregator
  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..')
    set :vendor, 'puneet.social_aggregator'

    use SocialAggregator::Controllers::Status
  end
end
