class Teacher::CoursesController < Teacher::AppController

	def index
  	@courses = current_teacher.courses
  end

  def new
  	@course = current_teacher.courses.new
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
  	params.require(:course).permit(:name, :details, :greade, :subject_area)
  end

end
