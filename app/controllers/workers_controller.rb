class WorkersController < ApplicationController

  def index
    render :partial => 'worker/main'
  end
end
