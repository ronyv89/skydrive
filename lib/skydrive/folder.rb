module Skydrive
  # The folder object
  class Folder < Skydrive::Object
    
    # Items in the folder
    # @return [Skydrive::Collection]
    def files
      response = client.get("/#{id}/files")
    end

    
  end
end