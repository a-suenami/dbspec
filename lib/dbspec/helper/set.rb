module Dbspec
  module Helper
    module Set
      def set(key, value)
        Dbspec.configuration.set(key, value)
      end
    end
  end
end
