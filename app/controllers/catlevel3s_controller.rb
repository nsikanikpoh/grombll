class Catlevel3sController < ApplicationController
  before_action :set_catlevel3, only: [:show, :edit, :update, :destroy]

  # GET /catlevel3s
  # GET /catlevel3s.json
  def index
    @catlevel3s = Catlevel3.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  end

  # GET /catlevel3s/1
  # GET /catlevel3s/1.json
  def show
    @companies = @catlevel3.companies.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
 
 
  end

  # GET /catlevel3s/new
  def new
    @catlevel2 = Catlevel2.find(params[:catlevel2_id])
     @catlevel3 = @catlevel2.catlevel3s.build
  end

  # GET /catlevel3s/1/edit
  def edit
  end

  # POST /catlevel3s
  # POST /catlevel3s.json
  def create
    @catlevel2 = Catlevel2.find(params[:catlevel2_id])
    @catlevel3 = @catlevel2.catlevel3s.create(catlevel3_params)
    @catlevel3.category_id = @catlevel2.category.id
    @catlevel3.catlevel1_id = @catlevel2.catlevel1.id
    @catlevel3.save

    respond_to do |format|
      if @catlevel3.save
        format.html { redirect_to @catlevel3, notice: 'Catlevel3 was successfully created.' }
        format.json { render :show, status: :created, location: @catlevel3 }
      else
        format.html { render :new }
        format.json { render json: @catlevel3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catlevel3s/1
  # PATCH/PUT /catlevel3s/1.json
  def update
    respond_to do |format|
      if @catlevel3.update(catlevel3_params)
        format.html { redirect_to @catlevel3, notice: 'Catlevel3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @catlevel3 }
      else
        format.html { render :edit }
        format.json { render json: @catlevel3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catlevel3s/1
  # DELETE /catlevel3s/1.json
  def destroy
    @catlevel3.destroy
    respond_to do |format|
      format.html { redirect_to catlevel3s_url, notice: 'Catlevel3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catlevel3
      @catlevel3 = Catlevel3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catlevel3_params
      params.require(:catlevel3).permit(:name, :info, :category_id, :catlevel2_id, :catlevel1_id)
    end
end
