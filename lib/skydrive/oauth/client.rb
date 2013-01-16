require 'oauth2'
module Skydrive
  # Oauth module
  module Oauth
    # Oauth client class
    class Client < OAuth2::Client
      attr_accessor :client_id, :client_secret, :oauth_client, :callback_url, :access_token

      def initialize(client_id, client_secret, callback_url, opts={})
        @client_id = client_id
        @client_secret = client_secret
        @callback_url = callback_url
        ssl = opts.delete(:ssl)

        @options = {
                    :site => 'https://login.live.com/',
                    :authorize_url => "oauth20_authorize.srf?scope=#{opts[:scope]}",
                    :token_url => 'oauth20_token.srf',
                    :parse_json => true}.merge(opts)
        @options[:connection_opts][:ssl] = ssl if ssl
        @oauth_client = OAuth2::Client.new(client_id, client_secret, @options)
      end

    end
  end
end