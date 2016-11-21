class Teacher::CoursesController < Teacher::AppController

	def index
  	@courses = current_teacher.courses
  end

  def new
  	@course = current_teacher.courses.new
  end
  
  def create
  	@course = current_teacher.courses.new(course_params)
  	if @course.save
  		redirect_to teacher_courses_path ,:notice=>"Course is Successfully Added."
  	else
  		render :new
  	end
  end

  def edit
		@course = Course.find(params[:id])
  end

	def update
		@course = Course.find(params[:id])
  	if(@course.update(course_params))
  		redirect_to teacher_courses_path ,:notice=>"Course is Successfully Updated."
  	else
  		render :edit
  	end
  end
  
  private
  def course_params
  	params.require(:course).permit(:name, :details, :greade, :subject_area)
  end

end
