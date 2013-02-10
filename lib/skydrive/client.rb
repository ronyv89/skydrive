module Skydrive
  # The client class
  class Client
    attr_reader :access_token
    include HTTMultiParty
    base_uri "https://apis.live.net/v5.0/"
    format :json

    def initialize access_token
      @access_token = access_token
      self.class.default_params :access_token => @access_token.token
    end

    # Do a 'get' request
    # @param [String] url the url to get
    # @param [Hash] options Additonal options to be passed
    def get url, options={}
      response = self.class.get(url, {:query => options}).parsed_response
    end

    # Do a 'post' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def post url, options={}
      response = self.class.post(url, {:body => options}).parsed_response
    end

    # Do a 'move' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def move url, options={}  
      response = self.class.move(url, {:body => options}).parsed_response
    end

    # Refresh the access token
    def refresh_access_token!
      @access_token = access_token.refresh!
      self.class.default_params :access_token => @access_token.token
      @access_token
    end
  end
end