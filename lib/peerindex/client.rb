module Peerindex
  # Wrapper for the Peerindex REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://dev.twitter.com/doc the Twitter API Documentation}.
  # @see http://dev.twitter.com/pages/every_developer
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'peerindex/client/user'

    alias :api_endpoint :endpoint

    include Peerindex::Client::User
  end
end
