class ProblemsController < ApplicationController
  def show
    logger.debug "FOUND IT"
  end

  respond_to :json

  def update
    logger.debug "Problems Logging"
    logger.debug params
    logger.debug "Problems Logging END"
    @problem = Problem.update(problem_params[:problem_id], :resolved => 1)
    render(json: params)
  end

  def create
    logger.debug params
    @problem = Problem.new(problem_params)
    @problem.problem_desc = problem_params[:problem_desc]
    @problem.problem_type_id = problem_params[:problem_type_id]
    @problem.resolved = problem_params[:resolved]

    if @problem.save
#      ThingMailer.  (@  .thing).deliver
      @problem.update_attribute(:sent, true)
      render(json: @problem)
    else
      render(json: {errors: @problem.errors}, status: 500)
    end
  end
  def destroy
    logger.debug params
  end

private

  def problem_params
    params.require(:problem).permit(:thing_id, :to_user_id, :problem, :problem_type_id, :from_user_id, :resolved, :problem_desc, :problem_id)
  end
end
