class MailboxesController < ApplicationController
  
  before_filter :authorize

  layout :layout
  
  def new
  	@mailbox = Mailbox.new
  end
  
  def create
  	
  end

end
