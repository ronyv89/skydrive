require 'mimemagic'

module Skydrive
  # The basic operations
  module Operations

    # Your home folder
    # @return [Skydrive::Folder]
    def my_skydrive
      response = get("/me/skydrive")
    end

    # Get the home folder of a particular user
    # @param [String] user_id ID of the user
    # @return [Skydrive::Folder]
    def user_skydrive user_id
      response = get("/#{user_id}/skydrive")
    end

    # Your camera_roll folder
    # @return [Skydrive::Folder]
    def my_camera_roll
      response = get("/me/skydrive/camera_roll")
    end

    # Get the camera_roll folder of a particular user
    # @param [String] user_id ID of the user
    # @return [Skydrive::Folder]
    def user_camera_roll user_id
      response = get("/#{user_id}/camera_roll")
    end

    # Your documents
    # @return [Skydrive::Folder]
    def my_documents
      response = get("/me/skydrive/my_documents")
    end

    # User's documents
    # @param [String] user_id ID of the user
    # @return [Skydrive::Folder]
    def user_documents user_id
      response = get("/#{user_id}/skydrive/my_documents")
    end

    # Your default album
    # @return [Skydrive::Album]
    def my_photos
      response = get("/me/skydrive/my_photos")
    end

    # User's photos
    # @param [String] user_id ID of the user
    # @return [Skydrive::Folder]
    def user_photos user_id
      response = get("/#{user_id}/skydrive/my_photos")
    end

    # Your public documents
    # @return [Skydrive::Folder]
    def my_public_documents
      response = get("/me/skydrive/public_documents")
    end

    # User's public documents
    # @param [String] user_id ID of the user
    # @return [Skydrive::Folder]
    def user_public_documents user_id
      response = get("/#{user_id}/skydrive/public_documents")
    end

    # Your shared items
    # @return [Skydrive::Collection]
    def my_shared_stuff
      response = get("/me/skydrive/shared")
    end

    # User's shared items
    # @return [Skydrive::Collection]
    def user_shared_stuff
      response = get("/#{id}/skydrive/shared")
    end

    # Your recent documents
    # @param [String] user_id ID of the user
    # @return [Skydrive::Collection]
    def my_recent_documents
      response = get("/me/skydrive/recent_docs")
    end

    # User's recent documents
    # @param [String] user_id ID of the user
    # @return [Skydrive::Collection]
    def user_recent_documents user_id
      response = get("/#{user_id}/skydrive/recent_docs")
    end

    # Your total and remaining storage quota
    # @return [Hash] contains keys quota and available
    def my_storage_quota
      response = get("/me/skydrive/quota")
    end

    # User's total and remaining storage quota
    # @return [Hash] contains keys quota and available
    def user_storage_quota
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

    # Get an object by its id
    # @param [String] id The id of the object you want
    def get_skydrive_object_by_id id
      response = get("/#{id}")
    end

    alias :update_folder :update_skydrive_object
    alias :update_album :update_skydrive_object
    alias :update_file :update_skydrive_object
    alias :update_video :update_skydrive_object
    alias :update_audio :update_skydrive_object
    alias :update_photo :update_skydrive_object

    alias :delete_folder :delete_skydrive_object
    alias :delete_album :delete_skydrive_object
    alias :delete_file :delete_skydrive_object
    alias :delete_video :delete_skydrive_object
    alias :delete_audio :delete_skydrive_object
    alias :delete_photo :delete_skydrive_object
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

    # Get comments associated with an object
    # @param [String] object_id The ID of the object
    # @return [Skydrive::Collection]
    def object_comments object_id
      response = get("/#{object_id}/comments")
    end

    # Delete a comment
    # @param [String] comment_id TD od the comment
    def delete_comment comment_id
      response = delete("/#{comment_id}")
    end

    # Comment about an object
    # @param [String] object_id ID of the object
    # @param [Hash] options
    # @option options [String] :message The comment message
    def create_comment object_id, options={}
      response = post("/#{object_id}/comments", options)
    end

    # Upload a file
    # @param [String] folder_path Either 'me/skydrive' or FOLDER_ID(id of the parent folder)
    # @param [String] filename Name of the new file
    # @param [File] The actual file to be uploaded
    # @param [Hash] options Any additional options to be passed
    # @option options [Boolean] :overwrite whether to overwrite the file
    # @return [Skydrive::File] the created file with minimum details
    def upload folder_path, filename, file, options={}
      # content_type = MimeMagic.by_path(file.path).type || 'application/octet-stream'
      content_type = ''
      response = put("/#{folder_path}/files/#{filename}", file.read, options, {'content-type' => content_type})
    end
  end
end
