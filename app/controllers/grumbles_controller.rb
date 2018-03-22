class GrumblesController < ApplicationController
  before_action :set_grumble, only: [:download_file, :comment, :assign_company, :show, :edit, :update, :destroy]

  # GET /grumbles
  # GET /grumbles.json
  def index
    @grumbles = Grumble.all
  end

  # GET /grumbles/1
  # GET /grumbles/1.json
  def show
  end

   def assign_company

  end

  def comment

  end

   def assign_update
      @grumble = Grumble.find(params[:id])
     # @company =  Company.find(params[:company_id])
      
      @grumble.update(grumble_params)
       respond_to do |format|
      if @grumble.update(grumble_params)
       
        @grumble.update(category_id: @grumble.company.category_id )
        format.html { redirect_to @grumble, notice: 'Grumble was successfully updated.' }
        format.json { render :show, status: :ok, location: @grumble }
      else
        format.html { render :edit }
        format.json { render json: @grumble.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /grumbles/new
  def new
    @company =  Company.find(params[:company_id])
    @grumble = @company.grumbles.new
  end

  # GET /grumbles/1/edit
  def edit
  end

  # POST /grumbles
  # POST /grumbles.json
  def create
    @company =  Company.find(params[:company_id])
    @grumble = @company.grumbles.create(grumble_params)
    @grumble.category_id = @company.category.id
    @grumble.grumbler_id = current_user.id
    @grumble.status = 0
    @grumble.save
    respond_to do |format|
      if @grumble.save
        format.html { redirect_to @grumble, notice: 'Grumble was successfully posted. Our team would contact the company invloved within 24 hrs' }
        format.json { render :show, status: :created, location: @grumble }
      else
        format.html { render :new }
        format.json { render json: @grumble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grumbles/1
  # PATCH/PUT /grumbles/1.json
  def update

    respond_to do |format|
      if @grumble.update(grumble_params)
        format.html { redirect_to @grumble, notice: 'Grumble was successfully updated.' }
        format.json { render :show, status: :ok, location: @grumble }
      else
        format.html { render :edit }
        format.json { render json: @grumble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grumbles/1
  # DELETE /grumbles/1.json
  def destroy
    @grumble.destroy
    respond_to do |format|
      format.html { redirect_to grumbles_url, notice: 'Grumble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def download_file
  send_file @grumble.file.path
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grumble
      @grumble = Grumble.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grumble_params
      params.require(:grumble).permit(:file, :remove_file, :file_cache, :status, :company_name, :complain, :category_id, :catlevel1_id, :catlevel2_id, :catlevel3_id, :city, :state, :date, :grumbler_id, :agency_id, :company_id)
    end
end
