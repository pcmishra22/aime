class Teacher::SchedulesController < Teacher::AppController
  layout 'teacher'

  def index
    @course_id =  params[:course_id]
    @schedule = Schedule.where(:course_id => @course_id )
  end

  def new  	
  	@schedule = Schedule.new
    @course_id =  params[:course_id]
    @course = Course.find(@course_id)
  end

  def create
    @course_id =  params[:course_id]

  	@schedule = Schedule.new(schedule_params)
    @schedule.course_id = @course_id

  	if @schedule.save
  		redirect_to teacher_course_schedules_path(:course_id=>@course_id) ,:notice=>"Schedule is Successfully Added."
  	else
  		render :new
  	end
  end

  def edit
    @course_id =  params[:course_id]
    @course = Course.find(@course_id)
    @schedule = Schedule.find(params[:id])
  end

  def update
    @course_id =  params[:course_id]
    @schedule = Schedule.find(params[:id])
    if(@schedule.update(schedule_params))
      redirect_to teacher_course_schedules_path(:course_id=>@course_id) ,:notice=>"Schedule is Successfully Updated."
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:topic,:course_id,:startdate,:enddate,:starttime,:endtime)
  end


end
