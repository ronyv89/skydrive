module Skydrive
  # The folder object
  class Folder < Skydrive::Object
    
    def files
      self.client.get("#{id}/files")
    end

  end
end