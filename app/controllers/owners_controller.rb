class OwnersController < ApplicationController
  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owners }
    end
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
    @owner = Owner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @owner }
    end
  end

  # GET /owners/new
  # GET /owners/new.json
  def new
    @owner = Owner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @owner }
    end
  end

  # GET /owners/1/edit
  def edit
    @owner = Owner.find(params[:id])
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render json: @owner, status: :created, location: @owner }
      else
        format.html { render action: "new" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    @owner = Owner.find(params[:id])

    respond_to do |format|
      if @owner.update_attributes(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to owners_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def owner_params
      params.require(:owner).permit(:address_1, :address_2, :city, :email, :name, :orgainization, :sms_number, :state, :voice_number, :zip)
    end
end
