require 'httmultiparty'
require 'json'
require "skydrive/version"
directory = File.expand_path(File.dirname(__FILE__))
module Skydrive
  # Your code goes here...
  class << self

    attr_accessor :client_id, :client_secret, :api_version, :ssl, :access_token, :locale

  end
end
