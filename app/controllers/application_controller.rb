class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :email, :password,:role_id])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :email, :password,:role_id])
    end
   
end
