require_relative 'boot'

require 'rails'

%w(
  action_controller/railtie
  action_view/railtie
  active_job/railtie
  active_model/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AboutAGirl
  class Application < Rails::Application
    config.assets.compile = true

    # Faster precompiles
    config.assets.initialize_on_precompile = false
  end
end
