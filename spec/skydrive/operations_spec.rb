require 'spec_helper'

describe Skydrive::Operations do

  let(:home) do
    YAML.load(%{
      id: folder.d7b50645b386df02
      from:
        name: 
        id: 
      name: SkyDrive
      description: ''
      parent_id: 
      size: 4654900
      upload_location: https://apis.live.net/v5.0/folder.d7b50645b386df02/files/
      comments_count: 0
      comments_enabled: false
      is_embeddable: false
      count: 9
      link: https://skydrive.live.com?cid=d7b50645b386df02
      type: folder
      shared_with:
        access: Just me
      created_time: 
      updated_time: '2013-02-09T05:32:51+0000'
    })
  end

  subject { skydrive_test_client }

  describe '#my_skydrive' do

    it "should display the contents of the acting user's home folder" do
      stub_request(:get, "https://apis.live.net/v5.0/me/skydrive?access_token=access_token").to_return(:status => 200, :body => home.to_json, :headers => {})
      skydrive_test_client.my_skydrive.should be_a(Skydrive::Folder)
    end

    
  end
end