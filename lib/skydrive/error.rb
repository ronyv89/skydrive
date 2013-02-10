module Skydrive
  # The class that handles the errors
  class Error < StandardError
    attr_reader :code, :error_message, :message
    def initialize error
      @code = error["code"]
      @error_message = error["message"]
    end

    def message
      "#{code}: #{error_message}"
    end

    alias :to_s :message
  end
end