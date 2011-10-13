require 'peerindex/api'
require 'peerindex/client'
require 'peerindex/configuration'
require 'peerindex/error'

module Peerindex
  extend Configuration
  class << self
    # Alias for Peerindex::Client.new
    #
    # @return [Peerindex::Client]
    def new(options={})
      Peerindex::Client.new(options)
    end

    # Delegate to Twitter::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
