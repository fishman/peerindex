module Peerindex
  class Client
    # Defines methods related to users
    module User
      # Returns extended information of a given user
      #
      # @see https://dev.twitter.com/docs/api/1/get/users/show
      # @rate_limited Yes
      # @requires_authentication No
      # @response_format `json`
      # @response_format `xml`
      # @overload user(user, options={})
      #   @param user [Integer, String] A Twitter user ID or screen name.
      #   @param options [Hash] A customizable set of options.
      #   @option options [Boolean, String, Integer] :include_entities Include {https://dev.twitter.com/docs/tweet-entities Tweet Entities} when set to true, 't' or 1.
      #   @return [Hashie::Mash] The requested user.
      #   @example Return extended information for @sferik
      #     Peerindex.user("sferik")
      #     Peerindex.user(7505382)  # Same as above
      def user(user, options={})
        merge_user_into_options!(user, options)
        response = get('v2/profile/profile', options)
        format.to_s.downcase == 'xml' ? response['user'] : response
      end

      # Returns true if the specified user exists
      #
      # @param user [Integer, String] A Twitter user ID or screen name.
      # @return [Boolean] true if the user exists, otherwise false.
      # @example Return true if @sferik exists
      #     Peerindex.user?("sferik")
      #     Peerindex.user?(7505382)  # Same as above
      # @requires_authentication No
      # @rate_limited Yes
      def user?(user, options={})
        merge_user_into_options!(user, options)
        get('v2/profile/profile', options, :format => :json, :raw => true)
        true
      rescue Peerindex::NotFound
        false
      end

      # Take a single user ID or screen name and merge it into an options hash with the correct key
      #
      # @param user_id_or_screen_name [Integer, String] A Twitter user ID or screen_name.
      # @param options [Hash] A customizable set of options.
      # @return [Hash]
      def merge_user_into_options!(user_id_or_screen_name, options={})
        case user_id_or_screen_name
        when Fixnum
          options[:id] = user_id_or_screen_name
        when String
          options[:id] = user_id_or_screen_name
        end
        options[:api_key] = self.api_key
        options
      end

    end
  end
end
