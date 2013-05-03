module Skydrive
  # Contains info about tags that are associated with a photo or a video on SkyDrive
  class Tag < Skydrive::Object

    # The center of the tag's horizontal position, measured as a floating-point percentage from 0 to 100, from the left edge of the photo
    # @return [Integer]
    def x
      object["x"]
    end

    # The center of the tag's vertical position, measured as a floating-point percentage from 0 to 100, from the top edge of the photo
    def y
      object["y"]
    end

  end
end