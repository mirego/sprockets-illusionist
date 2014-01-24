module SprocketsIllusionist
  module Config
    class << self
      attr_accessor :base_path
    end

    def self.configure
      yield self
    end
  end
end
