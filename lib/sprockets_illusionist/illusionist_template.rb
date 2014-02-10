require 'pathname'
require 'open3'
require 'tilt'

module SprocketsIllusionist
  class IllusionistTemplate < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def amd_module_name
      base_path = SprocketsIllusionist::Config.base_path
      file_name = File.basename(file, '.js.es6')

      if !base_path.nil?
        path = Pathname.new(file)
        dirname = File.dirname(path.relative_path_from(base_path))

        if dirname == '.'
          file_name
        else
          File.join(dirname, file_name)
        end
      else
        file_name
      end
    end

    def option_string_from_config
      module_type = SprocketsIllusionist::Config.try(:module_type)
      options = ["-m #{amd_module_name}"]

      if (!module_type.nil? && %w(amd cjs globals).include?(module_type))
        options << "-M #{module_type}"
      end

      options.join(' ')
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      stdout, _stderr, _status = Open3.capture3("illusionist #{option_string_from_config}", stdin_data: data)
      stdout
    end
  end
end
