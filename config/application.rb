require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PulseWatch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/services)

    # Para que se vean bien las horas levantadas de la base
    config.time_zone = 'America/Argentina/Buenos_Aires'

    # Para que grabe en la base con la hora del sistema local
    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.action_dispatch.default_headers.merge!({
  'Access-Control-Allow-Origin' => '*',
  'Access-Control-Request-Method' => '*'
	})
  end
end

