require 'spec_helper'
describe Skydrive::Oauth::Client do
  subject { described_class.new("client_id", "client_secret", "http://callback_demo", "wl.skydrive_update,wl.offline_access")}

  describe "#authorize_url" do
    before :each  do
      @uri = URI.parse(subject.authorize_url)
      @uri_params = CGI.parse(@uri.query)
    end
    
    it "should have the correct request token path" do
      @uri.path.should == "/oauth20_authorize.srf"
    end

    it "should have params: response_type, scope, client_id, redirect_uri" do
      @uri_params.keys.should include("response_type", "scope", "client_id", "redirect_uri")
    end

    it "should set the callback url" do
      subject.callback_url.should == @uri_params["redirect_uri"].first
    end
  end

  describe "#get_access_token" do

    before :each do
      stub_request(:post, "https://login.live.com/oauth20_token.srf").with(
        :body     => {
          "client_id"     =>  "client_id",
          "client_secret" =>  "client_secret",
          "code"          =>  "code",
          "grant_type"    =>  "authorization_code",
          "redirect_uri"  =>  "http://callback_demo"
        }, 
        :headers  => {
          'Accept'        =>  '*/*',
          'Content-Type'  =>  'application/x-www-form-urlencoded',
          'User-Agent'    =>  'Ruby'
        }
      ).to_return(
        :status   => 200, :body => {
          "token_type"            =>  "bearer", 
          "expires_in"            =>  3600,
          "scope"                 =>  "wl.skydrive_update,wl.offline_access",
          "access_token"          =>  "access_token",
          "refresh_token"         =>  "refresh_token",
          "authentication_token"  =>  "authentication_token"
        }.to_json,
        :headers  => {
          "content-type"          =>  "application/json",
      })
    end

    it "should get the access token, provided the code" do
      subject.get_access_token("code").token.should == "access_token"
    end

    it "should return an AccessToken object" do
      subject.get_access_token("code").should be_an(OAuth2::AccessToken)
    end
  end

  describe "get_access_token_from_hash" do
    it "should return an AccessToken object" do
      subject.get_access_token_from_hash("access_token", {:refresh_token => "refresh_token", :expires_at => Time.now.to_i}).should be_an(OAuth2::AccessToken)
    end

  end

end