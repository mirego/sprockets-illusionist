module SprocketsIllusionist
  module Config
    class << self
      attr_accessor :node_path
      attr_accessor :illusionist_path
      attr_accessor :base_path
      attr_accessor :module_type
    end

    def self.configure
      yield self
    end
  end
end
