require 'spec_helper'
describe Skydrive::User do
  let(:user) { YAML.load(%{
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
end