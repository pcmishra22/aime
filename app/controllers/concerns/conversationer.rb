module Conversationer
  extend ActiveSupport::Concern

  def index
    @conversations = @user.conversations
    render('conversations/index')
  end


end