require "picap_maps/version"
require "picap_maps/hexagon_geo"

module PicapMaps
  class Error < StandardError; end
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :database_name

    def initialize
      @database_name = 'default'
    end
  end
end
