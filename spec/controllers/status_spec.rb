require 'spec_helper'

describe SocialAggregator::Controllers::Status do
  def app
    SocialAggregator::Controllers::Status
  end

  it 'should check if the server is responding' do
    get '/ping'
    last_response.should be_ok
    last_response.body.should include "social aggregator"
  end
end
