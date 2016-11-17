class Parent::DashboardsController < Parent::ApplicationController

  def show
    @parent =  current_parent
  end
end
