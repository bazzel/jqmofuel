class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile
  before_filter :authenticate_user!

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
end
