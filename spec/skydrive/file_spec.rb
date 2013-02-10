require 'spec_helper'
describe Skydrive::File do

  subject {Skydrive::File.new({"name" => "hello"}.to_json)}
  it "should be inherited from Skydrive::Object" do
    Skydrive::File::superclass.should == Skydrive::Object
  end
end