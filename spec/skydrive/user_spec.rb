require 'spec_helper'
describe Skydrive::User do
  subject {Skydrive::User.new({"id" => "123456", "name" => "Rony Varghese"}.to_json)}
  it "should return the id of the user" do
    subject.id.should == "123456"
  end

  it "should return the name of the user" do
    subject.name.should == "Rony Varghese"
  end
end