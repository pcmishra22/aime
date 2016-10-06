class Student::ApplicationController < ApplicationController
  layout 'parents'

  before_action :verify_user_auth!
  before_action :authorize_student!
  before_action :set_active_menu

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  def records_per_page
    params[:per_page] || 100
  end

  private

  def authorize_student!
    render "errors/unauthorized", status: 401, layout: false unless current_user.is_parents?
  end

  def set_active_menu
    @active_menu = params[:controller].gsub('parents/','')
  end

 end
