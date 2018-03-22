class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :danger

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale



    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def self.default_url_options(options={})
      options.merge({ :locale => I18n.locale })
    end



  private


  def configure_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :avatar) }
 	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :avatar) }
  end
end
