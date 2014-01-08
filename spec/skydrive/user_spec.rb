require 'spec_helper'
describe Skydrive::User do
  let(:user) { YAML.load(%{
      id: "123456"
      name: "Rony Varghese"
    })
  }

  let(:skydrive){ YAML.load(%{
      id: "123456"
      name: "Rony Varghese"
    })

  }
  subject { Skydrive::User.new(skydrive_test_client, user)}
  it "should return the id of the user" do
    subject.id.should == "123456"
  end

  it "should return the name of the user" do
    subject.name.should == "Rony Varghese"
  end

  it "should return the user's skydrive home folder" do
    stub_request(:get, "https://apis.live.net/v5.0/123456/skydrive?access_token=access_token").to_return(:status => 200, :body => skydrive.to_json, :headers => {})
    subject.skydrive.should == 1
  end
end