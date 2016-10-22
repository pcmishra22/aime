class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  #before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    #teacher_dashboard_index_path

    send("#{resource.class.name.try(:downcase)}_dashboard_index_path")

  end

  def layout
    if current_user
      @layout = current_user.type.downcase
    else
      @layout = "application"
    end
  end

  def authorize
    redirect_to new_user_session_path unless current_user
  end

  protected

  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name,:email,:password) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email,:password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name,:email,:password,:current_password) }
  end
  
end
