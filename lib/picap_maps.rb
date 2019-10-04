require "picap_maps/version"
require "picap_maps/hexagon_geo"
require "picap_maps/configuration"

module PicapMaps
  class Error < StandardError; end
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
  module_function :configuration

end
