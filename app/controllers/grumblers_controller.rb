class GrumblersController < ApplicationController
	skip_before_action :authenticate_user!, if: [:new, :create]
	before_action :set_grumbler, only: [:show, :edit, :update, :destroy]

  # GET /grumblers
  # GET /grumblers.json
  def index
    @grumblers = Grumbler.all
  end

  # GET /grumblers/1
  # GET /grumblers/1.json
  def show
  end


  # GET /grumblers/new
  def new
    @grumbler = Grumbler.new
  end

  # GET /grumblers/1/edit
  def edit
  end

  # POST /grumblers
  # POST /grumblers.json
  def create
    @grumbler = Grumbler.create(grumbler_params)

    respond_to do |format|
      if @grumbler.save
        format.html { redirect_to root_url, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @grumbler }
      else
        format.html { render :new }
        format.json { render json: @grumbler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grumblers/1
  # PATCH/PUT /grumblers/1.json
  def update
    respond_to do |format|
      if @grumbler.update(grumbler_params)
        format.html { redirect_to @grumbler, notice: 'grumbler was successfully updated.' }
        format.json { render :show, status: :ok, location: @grumbler }
      else
        format.html { render :edit }
        format.json { render json: @grumbler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grumblers/1
  # DELETE /grumblers/1.json
  def destroy
    @grumbler.destroy
    respond_to do |format|
      format.html { redirect_to grumblers_url, notice: 'grumbler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grumbler
      @grumbler = Grumbler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grumbler_params
      params.require(:grumbler).permit(:first_name, :email, :password, :last_name, :avarta, :remove_avarta, :avarta_cache, :title, :sex, :phone, :address, :info, :category_id, :catlevel1_id, :catlevel2_id, :catlevel3_id, :city, :state)
    end
end
