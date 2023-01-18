class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def redirect
        if user_signed_in?
            if current_user.superadmin_role == TRUE 
                redirect_to tenants_path
            else
                if current_user.supervisor_role == TRUE 
                    redirect_to appointments_path
                else
                redirect_to new_appointment_path
                end
            end
        end
    end

end