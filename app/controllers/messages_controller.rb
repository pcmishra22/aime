class MessagesController < ApplicationController
  
  before_filter :authorize , :set_user_type
  layout :layout

  def index
    @user_id = current_user.id
  	@box = params[:format] || 'inbox'

    @msg_list = Message.getAllMessages(@user_id,@box)
   
  end

  def new
    @user_id = current_user.id
    if params[:type] == "user"
      @rid = params[:mid].to_i
      @parent = Message.get_parent(@user_id,@rid)
      @msg_list = Message.getMessages(@parent)
  	else
      @parent = Message.find(params[:mid])

      if @parent.user_id == @user_id
        @rid = @parent.recipient_user_id
      else
        @rid = @parent.user_id
      end      
      @msg_list = Message.getMessages(@parent)
    end

    if (@user_id == @rid)
      redirect_to messages_path
    end

    Message.setStatusRead(@user_id,@rid)
    @reciever_detail = User.find(@rid)
    @messages = Message.new
  end

  def create
    @flag = true
    @user_id = current_user.id
  	@messages = Message.new
  	if(params[:type] == "user")
  		@parent_message_id = 0
  		@recipient_user_id = params[:messageRId]
  	else
  		@parent_message_id = params[:messageRId]
  		@parent = Message.find(@parent_message_id)

  		if(@parent.user_id == @user_id)
  			@recipient_user_id = @parent.recipient_user_id
  		else @parent.recipient_user_id == @user_id
  			@recipient_user_id = @parent.user_id
      end
  	end

    if @flag === true
      @messages.user_id = @user_id
      @messages.recipient_user_id = @recipient_user_id
      @messages.text = params[:message]
      @messages.parent_message_id = @parent_message_id
      
      @messages.usertype = @usertype
      if @messages.save
        @message = {:status=>1,:messageBlock=>params[:message],:msg=>""}
      else
        @message = {:status=>2,:messageBlock=>params[:message],:msg=>"Message not sent."}
      end
    end
  	
  	respond_to do |format|
  	  format.html
  	  format.json { render json: @message}
  	end
  end
  private

  def set_user_type
    @usertype = session[:u_type]
  end


end
