class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_active_menu

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  def records_per_page
    params[:per_page] || 100
  end

  private

  def authorize_admin!
    render "errors/unauthorized", status: 401, layout: false unless current_user.is_admin?
  end

  def set_active_menu
    @active_menu = params[:controller].gsub('admin/','')
  end

 end
