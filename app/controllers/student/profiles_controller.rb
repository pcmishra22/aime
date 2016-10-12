class Student::ProfilesController < Student::ApplicationController
  layout 'student'
  helper UsersHelper
  def edit
  	@student = Student.find current_user.id
    @courses = {1=>"Science",2=>"Math"}
  end

  def update
  	@student = Student.find current_user.id
  	if(@student.update(update_param))
  		redirect_to edit_student_profile_path(current_user.id) , :notice=>'Profile Successfully Updated.'
  	else 
  		render :edit
  	end
  end
  def upload_file
    if( params[:converted] == "true" )
      @student = Student.find current_user.id
      @student.profile_photo = params[:url]
      @student.save
      redirect_to edit_student_profile_path(current_user.id), :notice=>'Profile Photo Updated Successfully Updated.'
    else
      redirect_to edit_student_profile_path(current_user.id), :notice=>'Profile Photo is not updated.'
    end
  end
  def social_update
    @student = Student.find current_user.id
    if (params[:social_type] == "twitter")
      @student.twitter = params[:url]
    elsif (params[:social_type] == "facebook")
      @student.facebook = params[:url]
    elsif (params[:social_type] == "instagram")
      @student.instagram = params[:url]
    elsif (params[:social_type] == "google")
      @student.google = params[:url]
    elsif (params[:social_type] == "pininterest")
      @student.pininterest = params[:url]
    elsif (params[:social_type] == "mailbox")
      @student.mailbox = params[:url]
    end
    @student.save
    render :json => {:status=>'1',:msg=>"Successfully Updated."}
  end
  private
	#user update allowed param
	def update_param
		params.require(:student).permit(:first_name,:last_name,:dob,:languages,:activities,:videos,:favourite_class,:study_groups,:awards)
	end
end
