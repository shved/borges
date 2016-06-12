require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Borges
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [:ru, :en]

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    class RackWithQuietAssets
      def initialize(app)
        @app = app

        quiet_assets_paths = [ %r[\A/{0,2}#{Rails.application.config.assets.prefix}] ]
        @assets_regex = /\A(#{quiet_assets_paths.join('|')})/
      end

      def call(env)
        if env['PATH_INFO'] =~ @assets_regex
          Rails.logger.silence do
            @app.call(env)
          end
        else
          @app.call(env)
        end
      end
    end

    config.middleware.insert_after ActionDispatch::Static, RackWithQuietAssets
  end
end
