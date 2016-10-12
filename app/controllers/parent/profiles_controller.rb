class Parent::ProfilesController < Parent::ApplicationController
  layout 'parent'
  helper UsersHelper
  def edit
  	@parent = Parent.find current_user.id
  	@courses = {1=>"Science",2=>"Math"}
  end
  def update
  	@parent = Parent.find current_user.id
  	if(@parent.update(update_param))
  		redirect_to edit_parent_profile_path(current_user.id) , :notice=>'Profile Successfully Updated.'
  	else 
  		render :edit
  	end
  end
  def upload_file
    if( params[:converted] == "true" )
      @parent = Parent.find current_user.id
      @parent.profile_photo = params[:url]
      @parent.save
      redirect_to edit_parent_profile_path(current_user.id), :notice=>'Profile Photo Updated Successfully Updated.'
    else
      redirect_to edit_parent_profile_path(current_user.id), :notice=>'Profile Photo is not updated.'
    end
  end
  def social_update
    @parent = Parent.find current_user.id
    if (params[:social_type] == "twitter")
      @parent.twitter = params[:url]
    elsif (params[:social_type] == "facebook")
      @parent.facebook = params[:url]
    elsif (params[:social_type] == "instagram")
      @parent.instagram = params[:url]
    elsif (params[:social_type] == "google")
      @parent.google = params[:url]
    elsif (params[:social_type] == "pininterest")
      @parent.pininterest = params[:url]
    elsif (params[:social_type] == "mailbox")
      @parent.mailbox = params[:url]
    end
    @parent.save
    render :json => {:status=>'1',:msg=>"Successfully Updated."}
  end
  private
	#user update allowed param
	def update_param
		params.require(:parent).permit(:first_name,:last_name,:dob,:languages)
	end
end
