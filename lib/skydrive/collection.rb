module Skydrive
  class Collection
    attr_reader :client, :data
    def initialize client, data
      @client = client
      @object = data
    end

    def type
      "collection"
    end
  end
end