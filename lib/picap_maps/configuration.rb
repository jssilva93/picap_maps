module PicapMaps
  class Configuration
    attr_accessor :database_name

    def initialize
      @database_name = nil
    end
  end
end