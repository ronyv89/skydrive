module Skydrive
  # A user's album in SkyDrive
  class Album < Skydrive::Object

    # The total number of items in the album.
    # @return [Integer]
    def count
      object["count"]
    end
    
  end
end