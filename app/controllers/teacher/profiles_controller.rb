class Teacher::ProfilesController < Teacher::ApplicationController
  layout 'teacher'
  skip_before_action :authorize_teacher!, only: [:new, :create]

  def index
    render json: current_user.teacher
    return
  end

  def new

    # Student has already their profile created
    redirect_to edit_teacher_profile_path if current_teacher

    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user


    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_profile_path, notice: 'Your teacher profile created successfully' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @teacher = current_teacher
    @courses = {1=>"Science",2=>"Math"}
  end

  def update
    @teacher = current_teacher
    if(@teacher.update(teacher_params))
      redirect_to teacher_profile_path(current_teacher) , :notice=>'Profile Successfully Updated.'
    else
      render :edit
    end
  end

  def show

  end

  def teacher_params
    params.require(:teacher).permit :first_name, :last_name, :profile_photo_url
  end
end
