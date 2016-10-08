class TestsController < ApplicationController

  def upload

  end

  def upload_file
    render text: params[:url]
  end
end