module PicapMaps
  class Configuration
    attr_accessor :database_name

    def initialize
      @database_name = 'mongo_map'
    end
  end
end