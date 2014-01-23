module SprocketsIllusionist
  class Engine < ::Rails::Engine
    initializer 'sprockets.illusionist', after: 'sprockets.environment', group: :all do |app|
      next unless app.assets
      app.assets.register_engine('.es6', IllusionistTemplate)
    end
  end
end
