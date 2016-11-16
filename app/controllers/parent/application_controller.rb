class Parent::ApplicationController < ApplicationController
  layout 'parent'

  before_action :authenticate_user!
  before_action :authorize_parents!

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  def records_per_page
    params[:per_page] || 100
  end

  private

  def authorize_parents!
    render "errors/unauthorized", status: 401, layout: false unless session[:u_type] == User.types['3']
  end


 end
