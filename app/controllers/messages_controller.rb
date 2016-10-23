class MessagesController < ApplicationController
  
  before_filter :authorize

  layout :layout

  def index
  	@box = params[:box] || 'inbox'
  end

  def new
    @user_id = current_user.id
    if params[:type] == "user"
      @rid = params[:mid]
      @parent = Message.get_parent(@user_id,@rid)
      @msg_list = Message.getMessages(@parent)
  	else
      @parent = Message.find(params[:mid])

      if @parent.user_id == @user_id
        @rid = @parent.recipient_user_id
      elsif @parent.recipient_user_id == @user_id
        @rid = @parent.user_id
      else
        redirect_to users_path
      end
      
      @msg_list = Message.getMessages(@parent)
    end
    @reciever_detail = User.find(@rid)
    @messages = Message.new
  end

  def create
  	@messages = Message.new
  	if(params[:type] == "user")
  		@parent_message_id = 0
  		@recipient_user_id = params[:messageRId]
  	else
  		@parent_message_id = params[:messageRId]
  		@parent = Message.find(@parent_message_id)
  		if(@parent.user_id == current_user.id)
  			@recipient_user_id = @parent.recipient_user_id
  		else
  			@recipient_user_id = @parent.user_id
  		end
  	end

  	@messages.user_id = current_user.id
  	@messages.recipient_user_id = @recipient_user_id
  	@messages.text = params[:message]
  	@messages.parent_message_id = @parent_message_id
  	if @messages.save
  		@message = {:status=>1,:messageBlock=>params[:message],:msg=>""}
  	else
  		@message = {:status=>1,:messageBlock=>params[:message],:msg=>"Message is not added."}
  	end
  	respond_to do |format|
	  format.html
	  format.json { render json: @message}
	end
  end
end
