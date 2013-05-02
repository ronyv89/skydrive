module Skydrive
  # A user's video in SkyDrive.
  class Video < Skydrive::File
    # The link that can be used to download the video file
    # @return [String]
    def download_link
      url = client.get("/#{id}/content", :download => true, :suppress_redirects => true)["location"]
    end

    # Download the video file
    def download
      uri = URI(download_link)
      response = HTTParty.get("http://#{uri.host}#{uri.path}?#{uri.query}")
      response.parsed_response
    end
  end
end