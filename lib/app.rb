module SocialAggregator
  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..')
    set :vendor, 'puneet.social_aggregator'

    use Rack::Session::Cookie

    use OmniAuth::Builder do
      provider :developer
      provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
      provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
      provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    end

    use SocialAggregator::Controllers::Status
    use SocialAggregator::Controllers::Session
  end
end
