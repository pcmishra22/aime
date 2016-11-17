class Student::ProfilesController < Student::ApplicationController
  layout 'student'
  helper UsersHelper

  skip_before_action :authorize_student, only: [:new, :create]

  def index
    render json: current_user.student
    return
  end

  def new

    # Student has already their profile created
    redirect_to edit_student_profile_path if current_student

    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user


    respond_to do |format|
      if @student.save
        format.html { redirect_to student_profile_path, notice: 'Your student profile created successfully' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@student = current_student
    @courses = {1=>"Science",2=>"Math"}
  end

  def update
  	@student = current_student
  	if(@student.update(student_params))
  		redirect_to student_profile_path(current_student) , :notice=>'Profile Successfully Updated.'
  	else 
  		render :edit
  	end
  end

  def show

  end

  def student_params
    params.require(:student).permit :first_name, :last_name, :profile_photo_url
  end

end
