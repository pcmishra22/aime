class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)

    if params[:user][:type] == 'teacher'
      teacher_dashboard_path
    elsif params[:user][:type] == 'parent'
      parent_dashboard_path
    else
      student_dashboard_path
    end
  end


  def authorize
    redirect_to new_user_session_path unless current_user
  end


end
