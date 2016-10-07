class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create  
  	@type = params[:user][:type]	
  	@user = User.new(user_param)
  	if(@type == 'Teacher')
		@user.type = 'Teacher'
	elsif(@type == 'Parent')
		@user.type = 'Parent'
	else
		@user.type = 'Student'
	end

	if @user.save
	  redirect_to '/users/sign_in'
	else	 
	 render :new
	end
  end

  private
	#user allowed param
	def user_param
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
	end
end





	