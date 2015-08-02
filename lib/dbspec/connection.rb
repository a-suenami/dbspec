require 'mysql2'

module Dbspec
  class Connection
    def initialize
      @client = Mysql2::Client.new(
        host: Dbspec.configuration.host,
        database: Dbspec.configuration.database,
        username: Dbspec.configuration.user,
        password: Dbspec.configuration.password,
      )
    end

    def execute(query)
      @client.query(query)
    end
  end
end
