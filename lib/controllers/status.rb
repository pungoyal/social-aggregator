class SocialAggregator::Controllers::Status < Sinatra::Base
  get '/ping' do
    "Hello from <strong>social aggregator</strong>, at #{Time.now}."
  end
end
