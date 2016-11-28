class Student::MessagesController < Student::AppController
  layout 'student'
  before_action :set_conversation, only: [:index, :create]


  def index
    @messages = params[:after].present? ? @conversation.messages.created_after_id(params[:after]) : @conversation.messages
    respond_to do |format|
      format.html
      format.json { render json: @messages}
    end
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
