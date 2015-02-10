module Skydrive

  # An object with an array of objects of multiple types
  class Collection
    attr_reader :client, :data
    def initialize client, data
      @client = client
      @data = data
    end

    # Additional type for the collection
    # @return [String]
    def type
      "collection"
    end

    # Array of items in the collection
    # @return [Array]
    def items
      @items = []
      @data.each do |object_data|
        if object_data["type"]
          @items << "Skydrive::#{object_data["type"].capitalize}".constantize.new(client, object_data)
        elsif object_data["id"].match /^comment\..+/
          @items << Skydrive::Comment.new(client, object_data)
        end
      end
      @items
    end
  end
end
