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
    # @param [String] object_id the id of the object to be deleted
    def delete_skydrive_object object_id
      response = delete("/#{object_id}")
    end

    # Update a skydrive object
    # @param [String] object_id the id of the object to be updated
    # @param [Hash] options The properties to be updated
    # @option options [String] :name The friendly name of the object
    # @option options [String] :description The description text about the object
    def update_skydrive_object object_id, options={}
      response = put("/#{object_id}", options)
    end

    # Create a new folder
    # @param [String] path the path where the new folder should be created
    # @param [Hash] options the details of the new folder
    # @option options [String] :name required, the name of the new folder
    # @option options [String] :description the description about the folder
    # @return [Skydrive::Folder] the new folder
    def create_folder path, options={}
      response = post("/#{path}", options)
    end

    # Create a new album. Albums can only be created in the path '/me/albums', so no need to pass the path as a parameter
    # @param [Hash] options the details of the new album
    # @option options [String] :name required, the name of the new album
    # @option options [String] :description the description about the album
    # @return [Skydrive::Album] the new album
    def create_album options={}
      response = post("/me/albums", options)
    end

  end
end