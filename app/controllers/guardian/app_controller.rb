class Guardian::AppController < ApplicationController
  layout 'guardian'
  before_action :authenticate_user!, :authorize_guardian!

  helper_method :current_guardian

  def current_guardian
    @current_guardian
  end

  private

  def authorize_guardian!
    @current_guardian = current_user.guardian
    redirect_to new_guardian_profile_path unless @current_guardian
  end


 end
