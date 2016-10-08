class Student::ProfilesController < Student::ApplicationController
  layout 'student'
  
  def edit
  	@student = Student.find current_user.id
  end

  def update
  	@student = Student.find params[:id]
  	if(@student.update(update_param))
  		redirect_to students_profile_path , :notice=>'Profile Successfully Updated.'
  	else 
  		render :edit
  	end
  end
  private
	#user update allowed param
	def update_param
		params.require(:student).permit(:first_name,:last_name,:dob,:languages,:activities,:videos,:favourite_class,:study_groups,:awards)
	end
end
