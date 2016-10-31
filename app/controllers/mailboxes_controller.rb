class MailboxesController < ApplicationController
  
  before_filter :authorize
  layout false
  
  def new
  	@mailbox = Mailbox.new
  end
  
  def create
  	
  end

end
