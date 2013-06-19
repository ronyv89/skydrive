require 'spec_helper'
describe Skydrive::File do

  let(:file) { JSON.load(%{{
        "id": "file.22688711f5410e6c.22688711F5410E6C!942", 
        "from": {
          "name": "William Flash", 
          "id": "22688711f5410e6c"
        }, 
        "name": "Processing.docx", 
        "description": null, 
        "parent_id": "folder.22688711f5410e6c.22688711F5410E6C!479", 
        "size": 12692, 
        "upload_location": "https://apis.live.net/v5.0/file.22688711f5410e6c.22688711F5410E6C!942/content/", 
        "comments_count": 0, 
        "comments_enabled": true, 
        "is_embeddable": false, 
        "source": "http://storage.live.com/s1pEwo9qzyT4_BJZqMNm-aVzgLo-WRsQGzjzFsXjyREuQG5pDYr237vKz3i2pmqFuniYPzsuIZAOCUMB_gdfKCUpLpVcaAMXGrk4T7jOWenRniCv9vex7GWfSvy-XCVBVnU/Processing.docx:Binary", 
        "link": "https://skydrive-df.live.com/redir.aspx?cid\u003d22688711f5410e6c\u0026page\u003dview\u0026resid\u003d22688711F5410E6C!942\u0026parid\u003d22688711F5410E6C!479", 
        "type": "file", 
        "shared_with": {
          "access": "Everyone (public)"
        }, 
        "created_time": "2011-10-12T23:18:23+0000", 
        "updated_time": "2011-10-12T23:18:23+0000"
      }
    })
  }
  subject {Skydrive::File.new(skydrive_test_client, file)}
  
  it "should be inherited from Skydrive::Object" do
    Skydrive::File::superclass.should == Skydrive::Object
  end

  describe "#from" do
    it "should return a user object" do
      subject.from.should be_a(Skydrive::User)
    end
  end

  describe '#size' do
    it "should return the size of the file in bytes" do
      subject.size.should == file["size"]
    end
  end

  describe '#comments_count' do
    it "should return the count of comments associated with the file" do
      subject.comments_count.should == file["comments_count"]
    end
  end

  describe '#comments_enabled?' do
    it "should return whether comments are enabled for the file" do 
      subject.should be_comments_enabled
    end
  end

  describe '#source' do 
    it "should return the URL to use to download the file from SkyDrive" do
      subject.source.should == file["source"]
    end
  end

  describe '#download_link' do
    it "should give the download link for the file" do
      stub_request(:get, "https://apis.live.net/v5.0/file.22688711f5410e6c.22688711F5410E6C!942/content?access_token=access_token&download=true&suppress_redirects=true").to_return(:status => 200, :body => {"location" => "http://dummylocation.com"}.to_json, :headers => {})
      subject.download_link.should == "http://dummylocation.com"
    end
  end

  describe '#download' do
    it "should download the file" do
      stub_request(:get, "https://apis.live.net/v5.0/file.22688711f5410e6c.22688711F5410E6C!942/content?access_token=access_token&download=true&suppress_redirects=true").to_return(:status => 200, :body => {"location" => "http://dummylocation.com/path?dummy_param=value"}.to_json, :headers => {})
      stub_request(:get, "http://dummylocation.com/path?dummy_param=value").
         to_return(:status => 200, :body => "\322\204\371\225Q", :headers => {})
      subject.download.should == "\322\204\371\225Q"
    end 
  end
end