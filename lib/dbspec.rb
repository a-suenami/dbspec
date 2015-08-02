require "dbspec/version"
require "dbspec/configuration"
require "dbspec/connection"

module Dbspec
  class << self
    def configuration
      @configuration ||= Dbspec::Configuration.new
    end

    def connection
      @connection ||= Dbspec::Connection.new
    end
  end
end
