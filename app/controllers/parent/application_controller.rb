class Parent::ApplicationController < ApplicationController
  layout 'parent'

  before_action :authenticate_user!
  before_action :authorize_student!

  helper_method :current_parent

  def current_parent
    @current_parent
  end

  private

  def authorize_parent!
    @current_parent = current_user.parent
    redirect_to parent_profiles_path unless @current_parent
  end


 end
