class Teacher::SchedulesController < Teacher::ApplicationController
  layout 'teacher'
	before_action :set_courses,only:[:new,:create]
  def new  	
  	@schedule = Schedule.new
  end
  def create
  	@schedule = Schedule.new(schedule_params)
  	if @schedule.save
  		redirect_to teacher_schedules_path ,:notice=>"Course is Successfully Added."
  	else
  		render :new
  	end
  end
  def edit
  
  end
  private
  def schedule_params
  	params.require(:schedule).permit(:topic,:course_id)
  end
  def set_courses
    @course_id = params[:id]
  	@courses = Course.my_active_courses(current_user.id)
  end
end
