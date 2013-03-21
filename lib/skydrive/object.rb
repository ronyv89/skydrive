module Skydrive
  # The base class for all objects
  class Object
    attr_reader :client, :object
    def initialize client, data
      @client = client
      @object = data
    end

    # ID of the object
    # @return [String] object id
    def id
      object["id"]
    end

    # Info about the user who uploaded the file.
    # @return [Skydrive::User]
    def from
      Skydrive::User.new(object["from"]) if object["from"]
    end

    # Name of the object
    # @return [String]
    def name
      object["name"]
    end

    # Desciption of the object
    # @return [String]
    def description
      object["description"]
    end

    # Type of object
    # @return [String]
    def type
      object["type"]
    end

    # A URL to view the item on SkyDrive
    # @return [String]
    def link
      object["link"]
    end

    # The time at which the object was created.
    # @return [Time]
    def created_time
      Time.parse(object["created_time"]) if object["created_time"]
    end

    # The time at which the object was updated.
    # @return [Time]
    def updated_time
      Time.parse(object["updated_time"]) if object["updated_time"]
    end

    # The URL to upload file content hosted in SkyDrive.
    # @return [String]
    def upload_location
      object["upload_location"]
    end

    # The ID of the parent object
    # @return [String]
    def parent_id
      object["parent_id"]
    end
    
    # The object that contains permission info.
    # @return [Hash]
    def shared_with
      object["shared_with"]
    end

    # Get json format object
    # @return [String]
    def to_json
      object.to_json
    end

    # Get the hash equivalent of the data
    # @return [Hash]
    def to_hash
      object
    end

    # The object that contains permission info.
    # @return [Hash]
    def shared_with
      object["shared_with"]
    end
  end
end