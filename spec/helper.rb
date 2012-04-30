require 'peerindex'
require 'rspec'
require 'webmock/rspec'
Peerindex.configure do |config|
  config.api_key = "fake"
end

def a_get(path, endpoint=Peerindex.endpoint)
  a_request(:get, endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
