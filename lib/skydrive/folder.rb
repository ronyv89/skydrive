module Skydrive
  # The folder object
  class Folder < Skydrive::Object
    
    def files
      response = client.get("#{id}/files")
      raise Skydrive::Error.new({:code => "invalid_response_format", :message => "The response has an invalid format"}) unless response["data"] or response["data"].is_a?(Array)
      client.object(response["data"])
    end

  end
end