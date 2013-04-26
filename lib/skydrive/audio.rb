module Skydrive
  # A user's audio file in SkyDrive.
  class Audio < Skydrive::Object

    # The size, in bytes, of the audio
    # @return [Integer]
    def size
      object["size"]
    end

    # The number of comments associated with the audio
    # @return [Integer]
    def comments_count
      object["comments_count"]
    end

    # A value that indicates whether comments are enabled for the audio
    # @return [Boolean]
    def comments_enabled
      object["comments_enabled"]
    end

    # A value that indicates whether this audio can be embedded
    # @return [Boolean]
    def is_embeddable
      object["is_embeddable"]
    end

    # The URL to use to download the audio from SkyDrive
    # @return [String]
    def source
      object["source"]
    end

    # The audio's title
    # @return [String]
    def title
      object["title"]
    end

    # The audio's artist name
    # @return [String]
    def artist
      object["artist"]
    end

    # The audio's album name
    # @return [String]
    def album
      object["album"]
    end

    # The artist name of the audio's album
    # @return [String]
    def album_artist
      object["album_artist"]
    end

    # The audio's genre
    # @return [String]
    def genre
      object["genre"]
    end

    # The audio's playing time, in milliseconds
    # @return [Integer]
    def duration
      object["duration"]
    end

    # A URL to view the audio's picture on SkyDrive
    # @return [String]
    def picture
      object["picture"]
    end

  end
end