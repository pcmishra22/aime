class Teacher::ApplicationController < ApplicationController
  layout 'teacher'

  before_action :authenticate_user!
  before_action :authorize_teacher!

  helper_method :current_teacher

  def current_teacher
    @current_teacher
  end

  private

  def authorize_parent!
    @current_teacher = current_user.teacher
    redirect_to teacher_profiles_path unless @current_teacher
  end

end
