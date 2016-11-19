class Teacher::AppController < ApplicationController
  layout 'teacher'

  before_action :authenticate_user!, :authorize_teacher!

  helper_method :current_teacher


  def current_teacher
    @current_teacher
  end

  private

  def authorize_teacher!
    @current_teacher = current_user.teacher
    redirect_to new_teacher_profile_path unless @current_teacher

  end

end
