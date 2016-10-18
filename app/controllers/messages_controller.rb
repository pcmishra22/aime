class MessagesController < ApplicationController
  
  before_filter :authorize

  layout "teacher"

  def index
  	@box = params[:box] || 'inbox'
  end

end
