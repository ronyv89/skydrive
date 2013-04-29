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

  subject {skydrive_test_client}

  before :each do
    stub_request(:get, "https://apis.live.net/v5.0/comment.22688711f5410e6c.22688711f0410e6c!818.22688711F5410E6C!979?access_token=access_token").to_return(:status => 200, :body => comment.to_json, :headers => {})
    @comment = skydrive_test_client.get("/comment.22688711f5410e6c.22688711f0410e6c!818.22688711F5410E6C!979")
  end

  it "should return the message associated with the comment" do
    @comment.message.should  eql "A lighthouse built on some rocks."
  end
end