class ThingsController < ApplicationController
  respond_to :json

  def show
    @things = Thing.find_closest(params[:lat], params[:lng], params[:limit] || 10)
#Added by Kaleb. Maker updates
    @things.each do |t|
      @pc = Problem.count(:thing_id, :conditions => ["thing_id = ? AND resolved = 0", t.id])
      # Generating a warning. Need to upgrade rails???
      t[:problem_count] = @pc
    end
#End marker updates
    unless @things.blank?
      respond_with @things
    else
      render(json: {errors: {address: [t("errors.not_found", thing: t("defaults.thing"))]}}, status: 404)
    end
  end

  def update
      @thing = Thing.find(params[:id])
      if @thing.update_attributes(thing_params)
        respond_with @thing
      else
        render(json: {errors: @thing.errors}, status: 500)
      end
  end

  def getCoords
    logger.debug "here we go"
    logger.debug params
    @thing = Thing.find(params[:thing_id])
    respond_with @thing
    #render(json: {errors: @thing.errors}, status:500)
  end

  private

  def thing_params
    params.require(:thing).permit(:name, :user_id, :id, :lat, :lng)
  end
end
