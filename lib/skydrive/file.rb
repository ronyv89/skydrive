module Skydrive
  # The file object
  class File < Skydrive::Object

    # The file size
    # @return [String]
    def size
      object["size"]      
    end

    # The number of comments associated with the file
    # @return [Integer]
    def comments_count
      object["comments_count"]
    end

    # A value that indicates whether comments are enabled for the file
    # @return [Boolean]
    def comments_enabled
      object["comments_enabled"]
    end

    # The URL to use to download the file from SkyDrive
    # @return [String]
    def source
      object["source"]
    end

    # The link that can be used to download the file
    # @return [String]
    def download_link
      url = client.get("/#{id}/content", :download => true, :suppress_redirects => true)["location"]
    end

    # Download the file
    def download
      uri = URI(download_link)
      response = HTTParty.get("http://#{uri.host}#{uri.path}?#{uri.query}")
      response.parsed_response
    end

  end
end