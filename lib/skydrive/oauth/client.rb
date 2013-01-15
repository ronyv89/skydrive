require 'oauth2'
module Skydrive
  # Oauth module
  module Oauth
    # Oauth client class
    class Client
      attr_accessor :client_id, :client_secret, :oauth_client, :callback_url, :access_token
      def initialize(client_id, client_secret, callback_url, opts={})
        @client_id = client_id
        @client_secret = client_secret
        @callback_url = callback_url
        ssl = opts.delete(:ssl)

        @options = {
                    :site => 'https://login.live.com/',
                    :authorize_url => "oauth20_authorize.srf?response_type=code&scope=#{opts[:scope]}",
                    :token_url => 'oauth20_token.srf
',
                    :parse_json => true}.merge(opts)
        @options[:connection_opts][:ssl] = ssl if ssl
        @oauth_client = OAuth2::Client.new(client_id, client_secret, @options)
      end

      # Step 1: URL for OAuth2 authorization of Microsoft Live
      # @return [String]
      def authorize_url
        oauth_client.auth_code.authorize_url(:redirect_uri => callback_url)
      end

      # Step 2: Get access token after authorizing user
      # @param [String] code The value extracted from the callback url param 'code'
      # @return [String] the access token
      def get_access_token code
        token = oauth_client.auth_code.get_token(code, :redirect_uri => callback_url)
        @access_token = token.token
      end

    end
  end
end