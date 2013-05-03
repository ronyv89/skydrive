module Skydrive
  # Comments that are associated with a photo, audio, or video 
  class Comment < Skydrive::Object

    # The text of the comment
    def message
      object["message"]
    end

    # Always return 'comment'
    # @return [String]
    def type
      "comment"
    end

    # Delete the comment
    def delete
      client.delete("/#{id}")
    end
  end
end