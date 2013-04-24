module Skydrive
  # The client class
  class Client
    attr_reader :access_token
    include HTTMultiParty
    include Operations
    base_uri "https://apis.live.net/v5.0/"

    def initialize access_token
      @access_token = access_token
      self.class.default_params :access_token => @access_token.token
    end

    # Do a 'get' request
    # @param [String] url the url to get
    # @param [Hash] options Additonal options to be passed
    def get url, options={}
      begin
        response = self.class.get(url, {:query => options})
      rescue Exception => e
        p e
      end
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response
    end

    # Do a 'post' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def post url, options={}
      response = self.class.post(url, {:body => options}).parsed_response
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response
    end

    # Do a 'move' request
    # @param [String] url the url to post
    # @param [Hash] options Additonal options to be passed
    def move url, options={}
      response = self.class.move(url, {:body => options}).parsed_response
      raise Skydrive::Error.new(response["error"]) if response["error"]
      response
    end

    # Refresh the access token
    def refresh_access_token!
      @access_token = access_token.refresh!
      self.class.default_params :access_token => @access_token.token
      @access_token
    end

    # Return a Skdrive::Object sub class
    def object response
      if response.is_a? Array
        return response.collect{ |object| "Skydrive::#{object["type"].capitalize}".constantize.new(self, object)}
      else
        return "Skydrive::#{response["type"].capitalize}"
      end
    end

    private

    def filtered_response response
      raise Skydrive::Error.new(:code => "no_response_received", :message => "Request didn't make through or response not received"
      raise Skydrive::Error.new(:code => "http_error_#{response.response.code}", :message => response.response.message) unless response.response.code == "200"

    end

  end
end