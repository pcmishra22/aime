class MailboxesController < ApplicationController
  
  before_filter :authorize
  layout :layout

  def index
  	@user_id = current_user.id
  	@box = params[:format] || 'inbox'

    @mails = Mailbox.getAllMails(@user_id,@box)
  end

  def new
  	@mailbox = Mailbox.new
  	render :layout => false
  end
  
  def create
  	@mailbox = Mailbox.new(mailbox_param)
  	@mailbox.mail_from = current_user.id
  	if @mailbox.save
  		redirect_to mailboxes_path, notice:"Mail Successfully sent."
  	else
  		render :new
  	end
  		
  end

  def show
  	@mailbox = Mailbox.new
  	@parent_mail = Mailbox.find(params[:id])

  	@user_id = current_user.id

  	if @parent_mail.mail_from == @user_id
  		@rid = @parent_mail.mail_to
  	else
  		@rid = @parent_mail.mail_from
  	end

  	@reciever_detail = User.find(@rid)

  	@mails = Mailbox.where("id = ? OR parent_id = ?",params[:id],params[:id]).order("id desc")
  end

  def createAjaxMail
  	  	@user_id = current_user.id

  	  	@mailbox = Mailbox.new()


	  	if params[:parent_id] != ""
	  		@parent_mail = Mailbox.find(params[:parent_id])
	  		if @parent_mail.mail_from == @user_id ||  @parent_mail.mail_to == @user_id
		  		if @parent_mail.mail_from == @user_id
			  		@rid = @parent_mail.mail_to
			  	else
			  		@rid = @parent_mail.mail_from
			  	end

			  	@reciever_detail = User.find(@rid)

			  	@mailbox.mail_from = @user_id
			  	@mailbox.mail_to = @rid
			  	@mailbox.to_email = @reciever_detail.email
			  	@mailbox.end_date = @parent_mail.end_date
			  	@mailbox.subject = @parent_mail.subject
			  	@mailbox.topics = @parent_mail.topics
			  	@mailbox.message = params[:message]
			  	@mailbox.parent_id = @parent_mail.id

			  	if @mailbox.save
        			@response = {:status=>1,:messageBlock=>params[:message],:msg=>""}
      			else
      				puts @mailbox.errors.messages.inspect
       				@response = {:status=>2,:messageBlock=>params[:message],:msg=>"Message not sent."}
      			end

			  	respond_to do |format|
			  	  format.html
			  	  format.json { render json: @response}
			  	end
			end 
	  	end
  end


   private
   def mailbox_param
     params.require(:mailbox).permit(:to_email,:end_date,:subject,:topics,:message)
   end

   def mailbox_ajax_param
     params.require(:mailbox).permit(:parent_id,:message)
   end

end
