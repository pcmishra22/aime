class Student::ConversationsController < Student::AppController
  layout 'student'


  def index
    @conversations = current_student.conversations
  end


end
