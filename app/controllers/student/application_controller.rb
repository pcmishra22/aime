class Student::ApplicationController < ApplicationController
  layout 'student'

  before_action :authenticate_user!
  before_action :authorize_student!

  helper_method :current_student

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  def records_per_page
    params[:per_page] || 100
  end

  def current_student
    @current_student
  end

  private

  def authorize_student!
    @current_student = current_user.student
    redirect_to student_profiles_path unless @current_student
  end
end
