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
end