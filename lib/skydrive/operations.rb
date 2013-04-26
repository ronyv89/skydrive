module Skydrive
  # The basic operations
  module Operations

    # Your home folder
    # @return [Skydrive::Folder]
    def my_skydrive
      response = get("/me/skydrive")
    end

    # Your camera_roll folder
    # @return [Skydrive::Folder]
    def my_camera_roll
      response = get("/me/skydrive/camera_roll")
    end

    # Your documents
    # @return [Skydrive::Folder]
    def my_documents
      response = get("/me/skydrive/my_documents")
    end

    # Your default album
    # @return [Skydrive::Photos]
    def my_photos
      response = get("/me/skydrive/my_photos")
    end

    # Your public documents
    # @return [Skydrive::Folder]
    def my_public_documents
      response = get("/me/skydrive/public_documents")
    end

    # Your shared items
    # @return [Skydrive::Collection]
    def my_shared_stuff
      response = get("/me/skydrive/shared")
    end

    # Your recent documents
    # @return [Skydrive::Collection]
    def recent_documents
      response = get("/me/skydrive/recent_docs")
    end

    # Your total and remaining storage quota
    # @return [Hash] contains keys quota and available
    def storage_quota
      response = get("/me/skydrive/quota")
    end

    # Delete an object with given id
    def delete_object object_id
      response = delete("/#{object_id}")
    end

  end
end