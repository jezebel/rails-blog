class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def site_config
    @site_config ||= Rails.application.config.site_config
  end
end
