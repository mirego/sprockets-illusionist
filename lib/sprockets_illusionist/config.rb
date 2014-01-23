module SprocketsIllusionist
  module Config
    extend self
    attr_accessor :base_path

    def configure
      yield self
    end
  end
end
