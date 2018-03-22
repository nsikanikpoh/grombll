class AgenciesController < ApplicationController
	before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencys
  # GET /agencys.json
  def index
    @agencies = Agency.all
  end

  # GET /agencys/1
  # GET /agencys/1.json
  def show
  end

  # GET /agencys/new
  def new
    @category = Category.find(params[:category_id])
     @agency = @category.agencies.build
  end

  # GET /agencys/1/edit
  def edit
  end

  # POST /agencys
  # POST /agencys.json
  def create
    
    @category = Category.find(params[:category_id])
    @agency = @category.agencies.create(agency_params)
   
    @agency.save
    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: 'agency was successfully created.' }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencys/1
  # PATCH/PUT /agencys/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: 'agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency }
      else
        format.html { render :edit }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencys/1
  # DELETE /agencys/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencys_url, notice: 'agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:first_name, :email, :password, :first_name, :avarta, :remove_avarta, :avarta_cache, :phone, :address, :info, :category_id, :catlevel1_id, :catlevel2_id, :catlevel3_id, :city, :state)
    end
end
