class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def site_config
    @site_config ||= Rails.application.config.site_config
  end
  helper_method :site_config
end
