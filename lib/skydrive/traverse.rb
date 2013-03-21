module Skydrive
  # Module with methods to traverse through Skydrive directories
  module Traverse
    
    def my_skydrive
      Skydrive::Folder.new(get("/me/skydrive"))
    end

  end
end