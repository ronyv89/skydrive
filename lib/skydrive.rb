require 'httmultiparty'
require 'json'
require "skydrive/version"
directory = File.expand_path(File.dirname(__FILE__))
module Skydrive
  # Your code goes here...
  class << self

    attr_accessor :client_id, :client_secret, :api_version, :ssl, :access_token, :locale
  end
  require 'active_support/time'
  require 'skydrive/operations'
  require 'skydrive/oauth/client'
  require 'skydrive/collection'
  require 'skydrive/client'
  require 'skydrive/object'
  require 'skydrive/user'

  require 'skydrive/file'
  require 'skydrive/folder'
  require 'skydrive/photo'
  require 'skydrive/album'
  require 'skydrive/audio'
  require 'skydrive/error'

end
