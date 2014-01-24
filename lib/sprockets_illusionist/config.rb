module SprocketsIllusionist
  module Config
    mattr_accessor :base_path

    def self.configure
      yield self
    end
  end
end
