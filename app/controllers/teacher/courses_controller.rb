class Teacher::CoursesController < Teacher::AppController
  layout 'teacher'
  before_action :set_course,only:[:edit,:update]
  def index
  	@course = Course.my_active_courses(current_user.id)
  end

  def new
  	@course = Course.new
  end
  
  def create
  	@course = Course.new(course_params)
  	@course.teacherid = current_user.id
  	if @course.save
  		redirect_to teacher_courses_path ,:notice=>"Course is Successfully Added."
  	else
  		render :new
  	end
  end

  def edit

  end
  def update
  	if(@course.update(course_params))
  		redirect_to teacher_courses_path ,:notice=>"Course is Successfully Updated."
  	else
  		render :edit
  	end
  end
  
  private
  def course_params
  	params.require(:course).permit(:name)
  end
  def set_course
  	@course = Course.find(params[:id])
  	if(@course.teacherid != current_user.id)
  		redirect_to teacher_courses_path ,:error=>"You cannot edit this Course."
  	end
  end
end
