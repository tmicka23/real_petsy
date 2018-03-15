class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :danger

  before_action :configure_devise_parameters, if: :devise_controller?








  private


  def configure_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar, :username, :email, :password, :password_confirmation) }
  end

end
