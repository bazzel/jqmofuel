class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :authenticate_user!, :except => :test_exception_notifier
  before_filter :set_locale
  before_filter :export_i18n_messages

  def test_exception_notifier
    raise 'This is a test. This is only a test.'
  end

  private
  def set_locale
    # Always convert to dash, so we can use the fallback mechanism of the plugin.
    dasherized = (params[:locale] || current_user.try(:locale) || "#{I18n.default_locale}").dasherize
    logger.debug "[#{self.class}.set_locale] Change locale to #{dasherized}."
    I18n.locale = dasherized
  end

  # i18n-js related:
  # Generate the translations messages defined in your configuration file
  # See https://github.com/fnando/i18n-js
  def export_i18n_messages
    SimplesIdeias::I18n.export! if Rails.env.development?
  end

end
