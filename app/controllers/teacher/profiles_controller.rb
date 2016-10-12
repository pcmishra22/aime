class Teacher::ProfilesController < Teacher::ApplicationController
  layout 'teacher'
  helper UsersHelper
  def edit
  	@teacher = Teacher.find current_user.id
  	@courses = {1=>"Science",2=>"Math"}
  end
  def update
  	@teacher = Teacher.find current_user.id
  	if(@teacher.update(update_param))
  		redirect_to edit_teacher_profile_path(current_user.id) , :notice=>'Profile Successfully Updated.'
  	else 
  		render :edit
  	end
  end
  def upload_file
    if( params[:converted] == "true" )
      @teacher = Teacher.find current_user.id
      @teacher.profile_photo = params[:url]
      @teacher.save
      redirect_to edit_teacher_profile_path(current_user.id), :notice=>'Profile Photo Updated Successfully Updated.'
    else
      redirect_to edit_teacher_profile_path(current_user.id), :notice=>'Profile Photo is not updated.'
    end
  end
  def social_update
    @teacher = Teacher.find current_user.id
    if (params[:social_type] == "twitter")
      @teacher.twitter = params[:url]
    elsif (params[:social_type] == "facebook")
      @teacher.facebook = params[:url]
    elsif (params[:social_type] == "instagram")
      @teacher.instagram = params[:url]
    elsif (params[:social_type] == "google")
      @teacher.google = params[:url]
    elsif (params[:social_type] == "pininterest")
      @teacher.pininterest = params[:url]
    elsif (params[:social_type] == "mailbox")
      @teacher.mailbox = params[:url]
    end
    @teacher.save
    render :json => {:status=>'1',:msg=>"Successfully Updated."}
  end
  private
	#user update allowed param
	def update_param
		params.require(:teacher).permit(:first_name,:last_name,:dob,:languages,:activities,:videos,:favourite_class,:awards)
	end
end
