require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Petsy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
        config.site = {

      name: 'Petsy.fr'
    }


    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end
    config.assets.paths << Rails.root.join('lib', 'assets', 'lib')

    # config/initializers/locale.rb
     
    # Where the I18n library should search for translation files
    I18n.load_path += Dir[Rails.root.join('config', 'locale', '*.{rb,yml}')]
     
    # Whitelist locales available for the application
    I18n.available_locales = [:fr, :en]
     
    # Set default locale to something other than :en
    I18n.default_locale = :fr
    config.i18n.default_locale = :fr
  end
end
