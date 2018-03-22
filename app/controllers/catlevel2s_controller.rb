class Catlevel2sController < ApplicationController
  before_action :set_catlevel2, only: [:newcatlevel3, :show, :edit, :update, :destroy]

  # GET /catlevel2s
  # GET /catlevel2s.json
  def index
    @catlevel2s = Catlevel2.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  end

  # GET /catlevel2s/1
  # GET /catlevel2s/1.json
  def show
  end

   def newcatlevel3

  end
  # GET /catlevel2s/new
  def new
    @catlevel1 = Catlevel1.find(params[:catlevel1_id])
     @catlevel2 = @catlevel1.catlevel2s.build
   
  end

  # GET /catlevel2s/1/edit
  def edit
  end

  # POST /catlevel2s
  # POST /catlevel2s.json
  def create
    @catlevel1 = Catlevel1.find(params[:catlevel1_id])
    @catlevel2 = @catlevel1.catlevel2s.create(catlevel2_params)
    @catlevel2.category_id = @catlevel1.category.id
    @catlevel2.save
    respond_to do |format|
      if @catlevel2.save
        format.html { redirect_to @catlevel2, notice: 'Catlevel2 was successfully created.' }
        format.json { render :show, status: :created, location: @catlevel2 }
      else
        format.html { render :new }
        format.json { render json: @catlevel2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catlevel2s/1
  # PATCH/PUT /catlevel2s/1.json
  def update
    respond_to do |format|
      if @catlevel2.update(catlevel2_params)
        format.html { redirect_to @catlevel2, notice: 'Catlevel2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @catlevel2 }
      else
        format.html { render :edit }
        format.json { render json: @catlevel2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catlevel2s/1
  # DELETE /catlevel2s/1.json
  def destroy
    @catlevel2.destroy
    respond_to do |format|
      format.html { redirect_to catlevel2s_url, notice: 'Catlevel2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catlevel2
      @catlevel2 = Catlevel2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catlevel2_params
      params.require(:catlevel2).permit(:name, :info, :category_id, :catlevel1_id)
    end
end
