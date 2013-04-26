require 'spec_helper'
describe Skydrive::Object do
  let(:folder) {
    JSON.load(%{
      {
        "id": "folder.8c8ce076ca27823f.8C8CE076CA27823F!142",
        "from": {
          "name": "Roberto Tamburello",
          "id": "8c8ce076ca27823f"
        },
        "name": "My Sample Folder in Album 1",
        "description": "",
        "parent_id": "folder.de57f4126ed7e411",
        "upload_location": "https://apis.live.net/v5.0/folder.de57f4126ed7e411.DE57F4126ED7E411!126/files/",
        "is_embeddable": true,
        "count": 3,
        "link": "https://cid-8c8ce076ca27823f.skydrive.live.com/redir.aspx?page\u003dself\u0026resid\u003d8C8CE076CA27823F!142\u0026parid\u003d8C8CE076CA27823F!126\u0026type\u003d5",
        "type": "folder",
        "shared_with": {
           "access": "Just me"
        },
        "created_time": "2011-04-22T00:36:30+0000",
        "updated_time": "2011-04-22T19:18:12+0000"
      }
    })
  }

  subject { Skydrive::Object.new(skydrive_test_client, folder) }

  it "should return the id of the object" do
    subject.id.should == "folder.8c8ce076ca27823f.8C8CE076CA27823F!142"
  end

  it "should return the owner user of the object" do
    subject.from.should be_a(Skydrive::User)
  end

  it "should return the name of the object" do
    subject.name.should == "My Sample Folder in Album 1"
  end

  it "should return the description of the object" do
    subject.description.should == ""
  end

  it "should return the type of the object" do
    subject.type.should == "folder"
  end

  it "should return the URL of the object, hosted in SkyDrive." do
    subject.link.should == "https://cid-8c8ce076ca27823f.skydrive.live.com/redir.aspx?page\u003dself\u0026resid\u003d8C8CE076CA27823F!142\u0026parid\u003d8C8CE076CA27823F!126\u0026type\u003d5"
  end

  it "should return the time at which the object was created" do
    subject.created_time.should be_a(Time)
  end

  it "should return the time at which the object was last updated" do
    subject.updated_time.should be_a(Time)
  end

  it "should return the URL to upload file content hosted in SkyDrive" do
    subject.upload_location.should == "https://apis.live.net/v5.0/folder.de57f4126ed7e411.DE57F4126ED7E411!126/files/"
  end

  it "should return the parent ID of the object" do
    subject.parent_id.should == "folder.de57f4126ed7e411"
  end

  it "should return the permission details" do
    subject.shared_with.should be_a(Hash)
  end

  it "should return the object in json format" do
    subject.to_json.should be_a(String)
  end

  it "should return the object itself" do
    subject.to_hash.should == folder
  end

end