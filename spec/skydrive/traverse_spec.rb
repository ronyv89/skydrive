require 'spec_helper'
describe Skydrive::Traverse do
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
  subject { skydrive_test_client }
  describe '#my_skydrive' do

    before :each do
      stub_request(:get, "https://apis.live.net/v5.0/me/skydrive?access_token=access_token").
         to_return(
          :status => 200,
          :body => folder.to_json,
          :headers => {})
    end

    it "should return a Skydrive::Folder object" do
      subject.my_skydrive.should be_a(Skydrive::Folder)
    end

    it "should display the current user's top folder" do

    end
  end
end