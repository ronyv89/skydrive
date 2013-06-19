require 'spec_helper'
describe Skydrive::Photo do
  let :photo do
    JSON.load %{
      {
         "id": "file.de57f4126ed7e411.DE57F4126ED7E411!128", 
         "from": {
            "name": "Nuno Bento", 
            "id": "de57f4126ed7e411"
         }, 
         "name": "Maui-2012_0034.JPG", 
         "description": null, 
         "parent_id": "folder.de57f4126ed7e411.DE57F4126ED7E411!126", 
         "size": 561683, 
         "comments_count": 1, 
         "comments_enabled": true, 
         "tags_count": 0, 
         "tags_enabled": true,
         "is_embeddable": true, 
         "picture": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:Thumbnail", 
         "source": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:HighRes", 
         "upload_location": "https://apis.live.net/v5.0/file.de57f4126ed7e411.DE57F4126ED7E411!128/content/", 
         "images": [
            {
               "height": 450, 
               "width": 600, 
               "source": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:WebReady", 
               "type": "normal"
            }, {
               "height": 132, 
               "width": 176, 
               "source": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:MobileReady", 
               "type": "album"
            }, {
               "height": 72, 
               "width": 96, 
               "source": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:Thumbnail", 
               "type": "thumbnail"
            }, {
               "height": 1200, 
               "width": 1600, 
               "source": "http://storage.live.com/s1pKk5vzd-gdPanbzKYhB0nQGn8wGq5DSgqvrgIHU1NTXA4e2-spGkAhQjW1d9pcgKAGLB4NsEsSvDoREmdx5w-JiFrinEJJuEoz08Ws_IFupkX2bPSvy5qmths9ijwvDrXi1OBCWk9GW9Kt-qNNOAA9g/Maui09_0034.JPG:HighRes", 
               "type": "full"
            }
         ], 
         "link": "https://skydrive.live.com/redir.aspx?cid\u003dde57f4126ed7e411\u0026page\u003dview\u0026resid\u003dDE57F4126ED7E411!128\u0026parid\u003dDE57F4126ED7E411!126", 
         "when_taken": "2008-03-24T23:41:53+0000", 
         "height": 1200, 
         "width": 1600, 
         "type": "photo",
         "location": {
             "latitude": 47.65316, 
             "longitude": -122.135911,
             "altitude": 43
         }, 
         "camera_make": "MyManufacturer",
         "camera_model": "MyModel",
         "focal_ratio": 2.8,
         "focal_length": 3.85,
         "exposure_numerator": 1,
         "exposure_denominator": 15, 
         "shared_with": {
            "access": "Everyone (public)"
         }, 
         "created_time": "2012-12-03T18:14:03+0000", 
         "updated_time": "2012-12-03T18:31:01+0000"
      }
    }
  end

  subject { Skydrive::Photo.new(skydrive_test_client, photo)}

  describe '#name' do
    it "should return the name of the photo" do
      subject.name.should == photo["name"]
    end
  end

  describe '#description' do
    it "should return the description of the photo" do
      subject.description.should == photo["description"]
    end
  end

  describe '#from' do
    it "should return a user" do
      subject.from.should be_a Skydrive::User
    end

    it "should return the info about the user who uploaded the photo" do
      subject.from.name.should == photo["from"]["name"]
      subject.from.id.should == photo["from"]["id"]
    end
  end

  describe '#tags_count' do
    it "should give the tags count of the photo" do
      subject.tags_count.should == 0
    end
  end

  describe '#tags_enabled' do
    it "should return whether tags are enabled for the photo" do
      subject.tags_enabled?.should == true
    end
  end

  describe '#parent_id' do
    it "should return the parent id of the photo" do
      subject.parent_id.should == photo["parent_id"]
    end
  end

  describe '#size' do
    it "should return the size of the photo in bytes" do
      subject.size.should == photo["size"]
    end
  end

  describe '#comments_count' do
    it "should return the comments associated with the photo" do
      subject.comments_count.should == photo["comments_count"]
    end
  end

  describe '#comments_enabled?' do
    it "should return whether tags are enabled for the photo" do
      subject.comments_enabled?.should == true
    end
  end

  describe '#is_embeddable? ' do
    it "should return whether the photo can be embedded" do
      subject.is_embeddable?.should == true
    end
  end

  describe '#picture' do
    it "should return the URL of the photo's picture" do
      subject.picture.should == photo["picture"]
    end
  end 

  describe '#source' do
    it 'should return the download URL for the photo.' do
      subject.source.should == photo["source"]
    end
  end

  describe 'upload_location' do
    it "should return the photo's upload location" do
      subject.upload_location.should == photo["upload_location"]
    end
  end

  describe '#images' do
    it "should return info about the photo's sizes" do
      subject.images.should == photo["images"]
    end

    it "should all have hieght, width, source and type" do
      subject.images.should each { |image|
        image.keys.should =~ ["height", "source", "type", "width"]
      }
    end
  end

  describe '#link' do 
    it "should return the url of the photo hosted in Skydrive" do
      subject.link.should == photo["link"]
    end
  end

  describe '#when_taken' do
    it "should return the time when the photo was taken" do
      subject.when_taken.should == Time.new(photo["when_taken"])
    end
  end

  describe '#download_link' do
    it "should give the download link for the photo" do
      stub_request(:get, "https://apis.live.net/v5.0/file.de57f4126ed7e411.DE57F4126ED7E411!128/content?access_token=access_token&download=true&suppress_redirects=true").to_return(:status => 200, :body => {"location" => "http://dummylocation.com"}.to_json, :headers => {})
      subject.download_link.should == "http://dummylocation.com"
    end
  end

  describe '#height' do 
    it "should return the height of the photo" do
      subject.height.should == photo["height"]
    end
  end

  describe '#width' do
    it "should return the width of the photo" do
      subject.width.should == photo["width"]
    end
  end

  describe '#location' do
    it "should return the location where the photo was taken" do
      subject.location.should == photo["location"]
    end
    it "should give latitude, longitude and altitude" do
      subject.location.keys.should =~ ['latitude', 'longitude', 'altitude']
    end
  end


  describe '#camera_make' do
    it "should return the make of the camera with which the photo was taken" do
      subject.camera_make.should == photo["camera_make"]
    end
  end

  describe '#camera_model' do
    it "should return the brand and model number of the camera that took the photo." do
      subject.camera_model.should == photo["camera_model"]
    end
  end

  describe '#focal_ratio' do
    it "should return the f-number that the photo was taken at" do
      subject.focal_ratio.should == photo["focal_ratio"]
    end
  end

  describe '#focal_length' do
    it "should return the focal length that the photo was taken at" do
      subject.focal_length.should == photo["focal_length"]
    end
  end

  describe '#exposure_numerator' do
    it "should return the numerator of the shutter speed that the photo was taken at" do
      subject.exposure_numerator.should == photo["exposure_numerator"]
    end
  end

  describe '#exposure_denominator' do
    it "should return the denominator of the shutter speed that the photo was taken at" do
      subject.exposure_denominator.should == photo["exposure_denominator"]
    end
  end

  describe '#download' do
    it "should download the photo" do
      stub_request(:get, "https://apis.live.net/v5.0/file.de57f4126ed7e411.DE57F4126ED7E411!128/content?access_token=access_token&download=true&suppress_redirects=true").to_return(:status => 200, :body => {"location" => "http://dummylocation.com/path?dummy_param=value"}.to_json, :headers => {})
      stub_request(:get, "http://dummylocation.com/path?dummy_param=value").
         to_return(:status => 200, :body => "\322\204\371\225Q", :headers => {})
      subject.download.should == "\322\204\371\225Q"
    end 
  end

end