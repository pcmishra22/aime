class Parent::ApplicationController < ApplicationController
  layout 'parent'

  before_action :authenticate_user!
  before_action :authorize_parent

  helper_method :current_parent

  def current_parent
    @current_parent
  end

  private

  def authorize_parent
    @current_parent = current_user.parent
    redirect_to new_parent_profile_path unless @current_parent
  end


 end
