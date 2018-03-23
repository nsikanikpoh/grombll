class Catlevel1sController < ApplicationController
  before_action :set_catlevel1, only: [:newcatlevel2, :show, :edit, :update, :destroy]

  # GET /catlevel1s
  # GET /catlevel1s.json
  def index
    @catlevel1s = Catlevel1.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  
  end

  # GET /catlevel1s/1
  # GET /catlevel1s/1.json
  def show
       @companies = @catlevel1.companies.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
 
  end

  def newcatlevel2

  end
  # GET /catlevel1s/new
  def new
    @category = Category.find(params[:category_id])
     @catlevel1 = @category.catlevel1s.build
   
  end

  # GET /catlevel1s/1/edit
  def edit
     
  end

  # POST /catlevel1s
  # POST /catlevel1s.json
  def create
    @category = Category.find(params[:category_id])
    @catlevel1 = @category.catlevel1s.create(catlevel1_params)
    @catlevel1.save

    respond_to do |format|
      if @catlevel1.save
        format.html { redirect_to @catlevel1, notice: 'Catlevel1 was successfully created.' }
        format.json { render :show, status: :created, location: @catlevel1 }
      else
        format.html { render :new }
        format.json { render json: @catlevel1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catlevel1s/1
  # PATCH/PUT /catlevel1s/1.json
  def update
      
    respond_to do |format|
      if @catlevel1.update(catlevel1_params)
        format.html { redirect_to @catlevel1, notice: 'Catlevel1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @catlevel1 }
      else
        format.html { render :edit }
        format.json { render json: @catlevel1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catlevel1s/1
  # DELETE /catlevel1s/1.json
  def destroy
      
    @catlevel1.destroy
    respond_to do |format|
      format.html { redirect_to catlevel1s_url, notice: 'Catlevel1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catlevel1
      @catlevel1 = Catlevel1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catlevel1_params
      params.require(:catlevel1).permit(:name, :info, :category_id)
    end
end
