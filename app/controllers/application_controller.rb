class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout
  protected
    # def after_sign_in_path_for(_resource)
    #   return_path = session["user_return_to"]
    #   session.delete("user_return_to")
    #   if current_user.admin?
    #     admin_dashboard_path
    #   elsif current_user.teacher?
    #     return_path || super || dashboard_path
    #   elsif current_user.parent?
    #     return_path || super || root_path
    #   end
    # end

    # def store_location
    #   # store last url - this is needed for post-login redirect to whatever the user last visited.
    #   if (request.fullpath != "/users/sign_in" &&
    #       request.fullpath != "/users/sign_up" &&
    #       request.fullpath != "/users/password" &&
    #       request.fullpath != "/users/sign_out" &&
    #       !request.xhr?) # don't store ajax calls
    #     session["user_return_to"] = request.fullpath
    #   end
    # end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :phone, ])
    end

    def current_school
      current_user.school
    end

    # def ensure_is_admin
    #   unless current_user.admin?
    #     redirect_to root_path, alert: 'You are not authorised to access this area.'
    #   end
    # end

  
  
  private
    def set_layout
      devise_controller? ? 'devise' : 'application'
    end

end
