
module PicapMaps
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
require "picap_maps/version"

require "picap_maps/configuration"
require "picap_maps/hexagon_geo"
