module Skydrive
  # The client class
  class Client
    attr_accessor :access_token
    include HTTMultiParty
    base_uri "https://apis.live.net/v5.0/"
    format :json

    def initialize access_token
      @access_token = access_token
      self.class.default_params :access_token => @access_token
    end

    # Do a 'get' request
    # @param [String] url the url to get
    # @param [Hash] options Additonal options to be passed
    def get url, options={}
      response = self.class.get(url, {:query => options}).parsed_response
    end
  end
end