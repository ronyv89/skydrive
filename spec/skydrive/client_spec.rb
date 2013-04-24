require 'spec_helper'
require 'active_support/time'
describe Skydrive::Client do

  let(:oauth_client) { Skydrive::Oauth::Client.new("client_id", "client_secret", "http://callback_demo", "wl.skydrive_update,wl.offline_access")}
  let(:access_token) { OAuth2::AccessToken.new(oauth_client, "access_token", {:refresh_token => "refresh_token", :expires_at => 1.hour.since(Time.now).to_i}) }
  subject { Skydrive::Client.new(access_token)}

  describe '#object' do
    it "should return a collection when there is 'data' key" do

    end
  end
end