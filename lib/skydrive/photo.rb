module Skydrive
  # A user's photo in SkyDrive.
  class Photo < Skydrive::File

    # The number of tags on the photo
    # @return [Integer]
    def tags_count
      object["tags_count"]
    end

    # Whether tags are enabled for the photo
    # @return [Integer]
    def tags_enabled?
      object["tags_enabled"]
    end

    
    # A URL of the photo's picture.
    # @return [String]
    def picture
      object["picture"]
    end

    # Info about various sizes of the photos
    # @return [Array<Hash>]
    def images
      object["images"]
    end
    
    # Time when the photo was taken
    # @return [Time]
    def when_taken
      Time.new object["when_taken"] if object["when_taken"]
    end

    # Height of the photo in pixels
    # @return [Integer]
    def height
      object["height"]
    end

    # Width of the photo in pixels
    # @return [Integer]
    def width
      object["width"]
    end

    # The location where the photo was taken.
    # @return [Hash]
    def location
      object["location"]
    end

    # The manufacturer of the camera that took the photo.
    # @return [String]
    def camera_make
      object["camera_make"]
    end

    # The brand and model number of the camera that took the photo.
    # @return [String]
    def camera_model
      object["camera_model"]
    end

    # The f-number that the photo was taken at
    # @return [Float]
    def focal_ratio
      object["focal_ratio"]
    end

    # The focal length that the photo was taken at
    # @return [Float]
    def focal_length
      object["focal_length"]
    end

    # The numerator of the shutter speed that the photo was taken at
    # @return [Integer]
    def exposure_numerator
      object["exposure_numerator"]
    end

    # The denominator of the shutter speed that the photo was taken at
    # @return [Integer]
    def exposure_denominator
      object["exposure_denominator"]
    end

  end
end