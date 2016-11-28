class Student::ConversationsController < Student::AppController
  before_action :set_user, only: [:index]
  include Conversationer



  private
  def set_user
    @user = current_student
  end
end
