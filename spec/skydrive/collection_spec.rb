require 'spec_helper'

describe Skydrive::Collection do

  let(:collection) do
    YAML.load(%{
    - id: folder.8c8ce076ca27823f.8C8CE076CA27823F!142
      from:
        name: Roberto Tamburello
        id: 8c8ce076ca27823f
      name: My Sample Folder in Album 1
      description: ''
      parent_id: folder.de57f4126ed7e411
      upload_location: https://apis.live.net/v5.0/folder.de57f4126ed7e411.DE57F4126ED7E411!126/files/
      is_embeddable: true
      count: 3
      link: https://cid-8c8ce076ca27823f.skydrive.live.com/redir.aspx?page=self&resid=8C8CE076CA27823F!142&parid=8C8CE076CA27823F!126&type=5
      type: folder
      shared_with:
        access: Just me
      created_time: '2011-04-22T00:36:30+0000'
      updated_time: '2011-04-22T19:18:12+0000'
    - id: file.22688711f5410e6c.22688711F5410E6C!942
      from:
        name: William Flash
        id: 22688711f5410e6c
      name: Processing.docx
      description: 
      parent_id: folder.22688711f5410e6c.22688711F5410E6C!479
      size: 12692
      upload_location: https://apis.live.net/v5.0/file.22688711f5410e6c.22688711F5410E6C!942/content/
      comments_count: 0
      comments_enabled: true
      is_embeddable: false
      source: http://storage.live.com/s1pEwo9qzyT4_BJZqMNm-aVzgLo-WRsQGzjzFsXjyREuQG5pDYr237vKz3i2pmqFuniYPzsuIZAOCUMB_gdfKCUpLpVcaAMXGrk4T7jOWenRniCv9vex7GWfSvy-XCVBVnU/Processing.docx:Binary
      link: https://skydrive-df.live.com/redir.aspx?cid=22688711f5410e6c&page=view&resid=22688711F5410E6C!942&parid=22688711F5410E6C!479
      type: file
      shared_with:
        access: Everyone (public)
      created_time: '2011-10-12T23:18:23+0000'
      updated_time: '2011-10-12T23:18:23+0000'
    - id: comment.22688711f5410e6c.22688711f0410e6c!818.22688711F5410E6C!979
      from:
        name: Roberto Tamburello
        id: 8c8ce076ca27823f
      message: A lighthouse built on some rocks.
      created_time: '2011-04-21T23:21:28+0000'
    })
  end

  subject { Skydrive::Collection.new(skydrive_test_client, collection) }
  describe "#items" do
    it "should return an array" do
      subject.items.should be_a Array
    end

    it "should return the items in the collection as skydrive objects" do
      subject.items.should each {|item|
        item.should be_a Skydrive::Object
      }
    end

    it "should resolve objects with no 'type' key in the hash" do
      subject.items[2].should be_a Skydrive::Comment
    end
  end

  describe "#type" do
    it "should return always return collection" do
      subject.type.should == "collection"
    end
  end
end