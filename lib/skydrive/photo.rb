module Skydrive
  # A user's photo in SkyDrive.
  class Photo < Skydrive::Object
    # The link that can be used to download the photo
    # @return [String]
    def download_link
      url = client.get("/#{id}/content", :download => true, :suppress_redirects => true)["location"]
    end

    # Download the photo
    def download
      uri = URI(download_link)
      response = HTTParty.get("http://#{uri.host}#{uri.path}?#{uri.query}")
      response.parsed_response
    end
  end
end