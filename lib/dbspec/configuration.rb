module Dbspec
  class InvalidConfigurationKeyError < StandardError
  end

  class Configuration
    def defaults
      {
        host: 'localhost',
        database: nil,
        user: nil,
        password: '',
      }
    end

    def initialize
      @configuration ||= defaults
    end

    def set(key, value)
      unless valid_keys.include?(key)
        raise InvalidConfigurationKeyError.new("Configuration key name '#{key}' is invalid.")
      end
      @configuration[key.to_sym] = value
    end

    def method_missing(method_name)
      unless valid_keys.include?(method_name)
        super
      end
      @configuration[method_name]
    end

    private

    def valid_keys
      defaults.keys
    end
  end
end
