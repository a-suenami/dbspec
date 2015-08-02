module Dbspec
  class Table
    attr_reader :columns

    def initialize(table_name)
      columns = Dbspec.connection.execute("SHOW FULL COLUMNS FROM `#{table_name}`")
      @columns = columns.map do |c|
        name = c['Field']
        Dbspec::Column.new(name)
      end
    end
  end
end
