class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  # before_action :redirect_to_domain if Rails.env.production?

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def redirect_to_domain
  #   domain_to_redirect_to = 'www.honeybolbas.cloud'
  #   domain_exceptions = ['www.honeybolbas.cloud']
  #   should_redirect = domain_exceptions.exclude? request.host
  #   new_url = "#{request.protocol}#{domain_to_redirect_to}#{request.fullpath}"
  #   redirect_to new_url, status: :moved_permanently if should_redirect
  # end
end
