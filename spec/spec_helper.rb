require "simplecov"
require "simplecov-rcov"

require 'webmock/rspec'
require 'rspec_multi_matchers'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter "vendor"
  add_filter "spec"
end if ENV["COVERAGE"]
require 'skydrive'

def skydrive_test_client
  oauth_client = Skydrive::Oauth::Client.new("client_id", "client_secret", "http://callback_demo", "wl.skydrive_update,wl.offline_access")
  access_token = OAuth2::AccessToken.new(oauth_client, "access_token", {:refresh_token => "refresh_token", :expires_at => 1.hour.since(Time.now).to_i})
  Skydrive::Client.new(access_token)
end