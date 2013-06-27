require 'spec_helper'
describe Skydrive::Audio do

  let :audio do
    JSON.load %{
      {
        "id" : "file.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E\!144",
        "from" : {
            "name" : "Stig Struve-Christensen",
            "id" : "a6b2a7e8f2515e5e"
        },
        "name" : "SampleAudio.mp3",
        "description" : null,
        "parent_id" : "folder.a6b2a7e8f2515e5e",
        "size" : 8414449,
        "upload_location" : "https://apis.live.net/v5.0/file.a6b2a7e8f2515e5e.A6B2A7E8F2515E5E!144/content/",
        "comments_count" : 0,
        "comments_enabled" : false,
        "is_embeddable" : false,
        "source" : "http://storage.live.com/s1p60U8Xs4UzIXTScrTioalE-ZaVFiDQBA15MS2BwcsuNjfG64Z2fw-DAjXnPuqC47YR40_xAoPD8aRGhtna9ZFZ9_oO4BTz4CWF973DTXMxc5U3TntcQ9qEA/SampleAudio.mp3:Binary",
        "link" : "https://skydrive.live.com/redir.aspx?cid\u003d22688711f5410e6c\u0026page\u003dview\u0026resid\u003d22688711F5410E6C!582\u0026parid\u003d22688711F5410E6C!581",
        "type" : "audio",
        "title" : "My Sample Audio",
        "artist" : "My Favorite Artist",
        "album" : "My Favorite Album",
        "album_artist" : "My Favorite Artist",
        "genre" : "Easy Listening",
        "duration" : 225000,
        "picture" : "https://storage.live.com/items/A6B2A7E8F2515E5E!144:MobileReady/SampleAudio.mp3?psid=1&ck=0&ex=720",
        "shared_with" : {
            "access" : "Just me"
        },
        "created_time" : "2012-09-23T22:00:57+0000",
        "updated_time" : "2012-09-03T22:00:57+0000"
      }
    }
  end

  subject {Skydrive::Audio.new(skydrive_test_client, audio)}
  describe '#title' do
    it "should return the title of the audio" do
      subject.title.should == audio["title"]
    end
  end

  describe '#artist' do
    it "should return the artist's name for the audio" do
      subject.artist.should == audio["artist"]
    end
  end

  describe '#album' do
    it "should return the album name" do
      subject.album.should == audio["album"]
    end
  end

  describe '#album_artist' do
    it "should return the name of the album artist" do
      subject.album_artist.should == audio["album_artist"]
    end
  end

  describe '#genre' do
    it "should return the genre of the audio" do
      subject.genre.should == audio["genre"]
    end
  end

  describe '#duration' do
    it "should return the duration of the audio" do
      subject.duration.should == audio["duration"]
    end
  end

  describe '#picture' do
    it "should return the url to view the audio's picture on SkyDrive" do
      subject.picture.should == audio["picture"]
    end
  end
end