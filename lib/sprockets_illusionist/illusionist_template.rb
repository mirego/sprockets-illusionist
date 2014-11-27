require 'pathname'
require 'open3'
require 'tilt'

module SprocketsIllusionist
  TranspileError = Class.new(StandardError)

  class IllusionistTemplate < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(_, _)
      stdout, stderr, _status = Open3.capture3("#{node_path} #{illusionist_path} #{option_string_from_config}", stdin_data: data)

      if stderr.empty?
        stdout
      else
        raise TranspileError, stderr
      end
    end

  private

    def node_path
      SprocketsIllusionist::Config.try(:node_path) || 'node'
    end

    def illusionist_path
      SprocketsIllusionist::Config.try(:illusionist_path) || '$(which illusionist)'
    end

    def amd_module_name
      base_path = SprocketsIllusionist::Config.base_path
      file_name = File.basename(file, '.js.es6')

      if !base_path.nil?
        relative_module_path(file, file_name, base_path)
      else
        file_name
      end
    end

    def relative_module_path(file, file_name, base_path)
      path = Pathname.new(file)
      directory = File.dirname(path.relative_path_from(base_path))

      if directory == '.'
        file_name
      else
        File.join(directory, file_name)
      end
    end

    def option_string_from_config
      module_type = SprocketsIllusionist::Config.try(:module_type)
      options = ["-m #{amd_module_name}"]

      if %w(amd cjs globals).include?(module_type)
        options << "-M #{module_type}"
      end

      options.join(' ')
    end
  end
end
