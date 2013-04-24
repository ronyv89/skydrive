module Skydrive
  module Operations

    def my_skydrive
      response = get("/me/skydrive")
    end
  end
end