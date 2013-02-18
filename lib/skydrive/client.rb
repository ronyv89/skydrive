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
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response["data"] ? response["data"] : response
    end

    # Do a 'post' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def post url, options={}
      response = self.class.post(url, {:body => options}).parsed_response
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response["data"] ? response["data"] : response
    end

    # Do a 'move' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def move url, options={}  
      response = self.class.move(url, {:body => options}).parsed_response
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response["data"] ? response["data"] : response
    end

    # Refresh the access token
    def refresh_access_token!
      @access_token = access_token.refresh!
      self.class.default_params :access_token => @access_token.token
      @access_token
    end

    private
    # Return a Skdrive::Object sub class
    def object response
      if response.is_a? Array
        return response.collect{ |object| "Skydrive::#{object["type"].capitalize}"}
      else
        return "Skydrive::#{response["type"].capitalize}"
      end
    end

  end
end