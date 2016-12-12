class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def site
    @site ||= Rails.application.config.site_config || Site.new
  end
  helper_method :site
end
