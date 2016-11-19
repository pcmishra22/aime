class Student::AppController < ApplicationController
  layout 'student'

  before_action :authenticate_user!, :authorize_student!

  helper_method :current_student

  def current_student
    @current_student
  end

  private

  def authorize_student!
    @current_student = current_user.student
    # @@current_student ||= current_user.student if current_user
    redirect_to new_student_profile_path unless @current_student
  end
end
