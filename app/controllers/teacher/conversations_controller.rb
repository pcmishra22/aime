class Teacher::ConversationsController < Teacher::AppController
  before_action :set_user, only: [:index]
  include Conversationer



  private
  def set_user
    @user = current_teacher
  end
end
