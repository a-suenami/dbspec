require "dbspec/version"
require "dbspec/table"
require "dbspec/column"
require "dbspec/configuration"
require "dbspec/connection"
require "dbspec/helper/set"

include Dbspec::Helper::Set

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
