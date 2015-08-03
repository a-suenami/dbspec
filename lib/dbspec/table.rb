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

    def has_column?(column_name)
      column = @columns.find{ |c| c.name == column_name.to_s }
      not column.nil?
    end
  end
end
