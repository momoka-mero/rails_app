class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        added_auth = [:name, :email, :password, :password_confirmation]
        devise_parameter_sanitizer.permit :sign_up, keys: added_auth
        devise_parameter_sanitizer.permit :account_update, keys: added_auth
        devise_parameter_sanitizer.permit :account_update, keys: added_auth
             

    end

end

  