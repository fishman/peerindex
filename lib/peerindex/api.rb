require 'peerindex/configuration'
require 'peerindex/connection'
require 'peerindex/request'

module Peerindex
  # @private
  class API
    include Connection
    include Request

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Peerindex.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
