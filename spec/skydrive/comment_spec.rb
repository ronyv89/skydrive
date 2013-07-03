require 'spec_helper'

describe Skydrive::Comment do

  let(:comment) do 
    YAML.load(%{
      id: comment.22688711f5410e6c.22688711f0410e6c!818.22688711F5410E6C!979
      from:
        name: Roberto Tamburello
        id: 8c8ce076ca27823f
      message: A lighthouse built on some rocks.
      created_time: '2011-04-21T23:21:28+0000'
    })
  end

  subject { Skydrive::Comment.new(skydrive_test_client, comment)}

  it "should return the message associated with the comment" do
    subject.message.should  eql "A lighthouse built on some rocks."
  end

  it "should return comment as the type" do
    subject.type.should == "comment"
  end

  it "should delete the comment" do
    stub_request(:delete, "https://apis.live.net/v5.0/comment.22688711f5410e6c.22688711f0410e6c!818.22688711F5410E6C!979?access_token=access_token").
         to_return(:status => 204, :body => "", :headers => {})
    subject.delete.should be_true
  end
end