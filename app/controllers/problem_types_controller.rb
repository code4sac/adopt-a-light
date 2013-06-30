class ProblemTypesController < ApplicationController
  # GET /problem_types
  # GET /problem_types.json
  def index
    @problem_types = ProblemType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problem_types }
    end
  end

  # GET /problem_types/1
  # GET /problem_types/1.json
  def show
    @problem_type = ProblemType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem_type }
    end
  end

  # GET /problem_types/new
  # GET /problem_types/new.json
  def new
    @problem_type = ProblemType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_type }
    end
  end

  # GET /problem_types/1/edit
  def edit
    @problem_type = ProblemType.find(params[:id])
  end

  # POST /problem_types
  # POST /problem_types.json
  def create
    @problem_type = ProblemType.new(problem_type_params)

    respond_to do |format|
      if @problem_type.save
        format.html { redirect_to @problem_type, notice: 'Problem type was successfully created.' }
        format.json { render json: @problem_type, status: :created, location: @problem_type }
      else
        format.html { render action: "new" }
        format.json { render json: @problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_types/1
  # PATCH/PUT /problem_types/1.json
  def update
    @problem_type = ProblemType.find(params[:id])

    respond_to do |format|
      if @problem_type.update_attributes(problem_type_params)
        format.html { redirect_to @problem_type, notice: 'Problem type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_types/1
  # DELETE /problem_types/1.json
  def destroy
    @problem_type = ProblemType.find(params[:id])
    @problem_type.destroy

    respond_to do |format|
      format.html { redirect_to problem_types_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def problem_type_params
      params.require(:problem_type).permit(:name)
    end
end
