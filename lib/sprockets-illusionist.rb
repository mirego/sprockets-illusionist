require 'sprockets_illusionist/version'
require 'sprockets_illusionist/config'
require 'sprockets_illusionist/illusionist_template'

module SprocketsIllusionist
  if defined?(Rails) && defined?(::Rails::Engine)
    require 'sprockets_illusionist/engine'
  else
    require 'sprockets'
    Sprockets.register_engine('.es6', IllusionistTemplate)
  end
end
