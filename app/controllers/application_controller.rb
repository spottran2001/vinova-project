class ApplicationController < ActionController::Base
  include Pagy::Backend
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  # def after_sign_in_path_for(resource)
  #   # if resource.is_admin?
  #   #   redirect_to users_path
  #   # else
  #   #   redirect_to root_path
  #   # end
  # end

  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end