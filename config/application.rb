require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Grombll
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  	config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.unknown_asset_fallback = true
	# Enable the asset pipeline
	config.assets.enabled = true
# Version of your assets, change this if you want to expire all your assets
	config.assets.version = '1.0'
  end
end
