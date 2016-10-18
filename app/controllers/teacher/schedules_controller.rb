class Teacher::SchedulesController < Teacher::ApplicationController
  layout 'teacher'
  before_action :set_courses,only:[:index,:new,:create,:edit,:update]
	before_action :validate_course,only:[:create,:update]

  def index
    @schedule = Schedule.where(:course_id=>params[:course_id])
  end

  def new  	
  	@schedule = Schedule.new
  end

  def create
  	@schedule = Schedule.new(schedule_params)
    @course_id = @schedule.course_id
  	if @schedule.save
  		redirect_to teacher_schedules_path(:course_id=>@course_id) ,:notice=>"Schedule is Successfully Added."
  	else
  		render :new
  	end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @course_id = @schedule.course_id
    if(@schedule.update(schedule_params))
      redirect_to teacher_schedules_path(:course_id=>@course_id) ,:notice=>"Schedule is Successfully Updated."
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:topic,:course_id,:startdate,:enddate,:starttime,:endtime)
  end

  def set_courses
    @course_id = params[:course_id]
  	@courses = Course.my_active_courses(current_user.id)
  end

  def validate_course
    @course = Course.find(params[:schedule][:course_id])
    if(@course.teacherid != current_user.id)
      redirect_to teacher_courses_path ,:alert=>"Something is wrong.Please try again."
    end
  end

end
