module Skydrive
  # The folder object
  class Folder < Skydrive::Object

    # Items in the folder
    # @param [Hash] options Additional parameters
    # @option options [Integer] :limit the maximum number of results to return
    # @option options [Integer] :offset the index of the first item to get
    # @option options [String] :sort_by set the item's sort criteria. Can be 'created, updated, name, size, or default'
    # @option options [String] :sort_order set the item's sort order. Can be 'ascending or descending'
    # @return [Skydrive::Collection]
    def files options={}
      response = client.get("/#{id}/files")
    end

    # Get all the photos in the folder
    # @param [Hash] options Additional parameters
    # @option options [Integer] :limit the maximum number of results to return
    # @option options [Integer] :offset the index of the first item to get
    # @option options [String] :sort_by set the item's sort criteria. Can be 'created, updated, name, size, or default'
    # @option options [String] :sort_order set the item's sort order. Can be 'ascending or descending'
    # @return [Skydrive::Collection]
    def photos options={}
      response = client.get("/#{id}/photos", options)
    end

    # Get all the videos in the folder
    # @param [Hash] options Additional parameters
    # @option options [Integer] :limit the maximum number of results to return
    # @option options [Integer] :offset the index of the first item to get
    # @option options [String] :sort_by set the item's sort criteria. Can be 'created, updated, name, size, or default'
    # @option options [String] :sort_order set the item's sort order. Can be 'ascending or descending'
    # @return [Skydrive::Collection]
    def videos options={}
      response = client.get("/#{id}/videos", options)
    end

    # Delete the folder
    def delete
      client.delete("/#{id}")
    end

    # Update the folder properties
    # @param [Hash] options
    # @option options [String] :name New name of the folder
    # @option options [String] :description Description for the folder
    # @return [Skydrive::Folder] the updated folder object
    def update options={}
      client.put("/#{id}", options)
    end
  end
end