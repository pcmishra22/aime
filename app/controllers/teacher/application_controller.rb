class Teacher::ApplicationController < ApplicationController
  layout 'teacher'

  before_action :authenticate_user!
  before_action :authorize_teacher!

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  def records_per_page
    params[:per_page] || 20
  end

  private

  def authorize_teacher!
    render "errors/unauthorized", status: 401, layout: false unless session[:u_type] == User.types['2']
  end
 end
