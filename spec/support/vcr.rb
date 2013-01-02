class VCR::Cassette
  def sanitized_name
    name.to_s.gsub(/[^\w\-\/]+/, '_').downcase
  end
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |config|
  config.cassette_library_dir     = 'spec/cassettes'
  config.default_cassette_options = { record: :once, match_requests_on: [:host, :path, :method] }
  config.configure_rspec_metadata!
  config.hook_into :fakeweb
end
