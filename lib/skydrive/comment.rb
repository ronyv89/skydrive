module Skydrive
  # Comments that are associated with a photo, audio, or video 
  class Comment < Skydrive::Object

    # The text of the comment
    def message
      object["message"]
    end

    def type
      "comment"
    end

  end
end