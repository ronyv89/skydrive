module Skydrive
  # The folder object
  class Folder < Skydrive::Object
    
    # The files within the folder
    # @return [Skydrive::Collection]
    def files
      response = client.get("/#{id}/files")
    end

  end
end