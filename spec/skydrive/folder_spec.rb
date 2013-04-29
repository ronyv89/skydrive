require 'spec_helper'

describe Skydrive::Folder do
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
  let(:folder_files) { 

    JSON.load(%{
      {
        "data": [ 
          {
            "id": "folder.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E!110", 
            "upload_location": "https://apis.live.net/v5.0/folder.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E!110/files/",
            "type": "folder"
          },
          {
            "id": "photo.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E!131", 
            "upload_location": "https://apis.live.net/v5.0/photo.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E!131/content/", 
            "type": "photo"
          }
        ]
      }
    })
  }
  subject { Skydrive::Folder.new(skydrive_test_client, folder) }
  it "should return the collection of files/folders in the folder" do 
    stub_request(:get, "https://apis.live.net/v5.0/folder.8c8ce076ca27823f.8C8CE076CA27823F!142/files?access_token=access_token"). to_return(:status => 200, :body => folder_files.to_json, :headers => {}) 
    subject.files.should be_a Skydrive::Collection
  end

  it "should delete the folder" do
    stub_request(:delete, "https://apis.live.net/v5.0/folder.8c8ce076ca27823f.8C8CE076CA27823F!142?access_token=access_token").to_return(:status => 204, :body => nil, :headers => {})
    subject.delete.should be_true
  end
end