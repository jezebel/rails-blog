class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def site
    @site ||= Site.new
  end
  helper_method :site
end
