class Teacher::DashboardsController < Teacher::ApplicationController
  layout 'teacher'

  def show

    @teacher =  current_teacher
  end

end
