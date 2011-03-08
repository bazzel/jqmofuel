class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile
  before_filter :authenticate_user!
  before_filter :set_locale

  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      logger.debug("[#{self.class}.mobile_device?] Analyzing HTTP_USER_AGENT:\n\t#{request.env['HTTP_USER_AGENT']}")
      request.env['HTTP_USER_AGENT'] =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  def set_locale
    # Always convert to dash, so we can use the fallback mechanism of the plugin.
    dasherized = (params[:locale] || current_user.locale || "#{I18n.default_locale}").dasherize
    logger.debug "[#{self.class}.set_locale] Change locale to #{dasherized}."
    I18n.locale = dasherized
  end
end
