require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AboutAGirl
  class Application < Rails::Application
    # Enable the asset pipeline
    config.assets.enabled = true

    # Faster precompiles
    config.assets.initialize_on_precompile = false
  end
end
