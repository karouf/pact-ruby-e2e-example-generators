source "http://rubygems.org"

if ENV['X_PACT_DEVELOPMENT']
  gem "pact", path: '../pact'
  gem "pact-support", path: '../pact-support'
  gem "pact-mock_service", path: '../pact-mock_service'
else
  if ENV['FAIL']
    gem "pact", "1.66.0"
  else
    gem "pact", "1.65.3"
  end
end

gem "pact_broker-client"
gem "rake", "~> 13"
gem "rspec", "~> 3"
gem "faraday", "~> 2.0", "< 3.0"
gem "pry-byebug", "~> 3"
