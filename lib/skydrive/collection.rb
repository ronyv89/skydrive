module Skydrive

  # An object with an array of objects of multiple types
  class Collection
    attr_reader :client, :data
    def initialize client, data
      @client = client
      @object = data
    end

    # Additional type for the collection
    # @return [String]
    def type
      "collection"
    end
  end
end