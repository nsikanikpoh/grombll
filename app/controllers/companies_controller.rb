class CompaniesController < ApplicationController
	before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companys
  # GET /companys.json
  def index
    @companies = Company.all
  end

  # GET /companys/1
  # GET /companys/1.json
  def show
  end


  def unknown_company
    index
    @companies.each do |company|

        if company.first_name == "Base Company"

          @company = company
        end
    end
    return @company
  end
  

  # GET /companys/new
  def new
    @context = context
    @company = @context.companies.new
  end

  # GET /companys/1/edit
  def edit
   
  end

  # POST /companys
  # POST /companys.json
  def create
     @context = context
    @company = @context.companies.create(company_params)
    @company.category_id = @context.category.id
    respond_to do |format|
      if @company.save
        format.html { redirect_to context_url(context), notice: 'company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companys/1
  # PATCH/PUT /companys/1.json
  def update
  
    respond_to do |format|
      if @company.update_attributes(company_params)
        format.html { redirect_to context_url(context), notice: 'company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companys/1
  # DELETE /companys/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companys_url, notice: 'company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit!
    end
    def context
      if params[:catlevel1_id]
        id = params[:catlevel1_id]
        Catlevel1.find(params[:catlevel1_id])
      elsif params[:catlevel2_id]
        id = params[:catlevel2_id]
        Catlevel2.find(params[:catlevel2_id])
      else 
        id = params[:catlevel3_id]
        Catlevel3.find(params[:catlevel3_id])
      end
    end

    def context_url(context)
        if Catlevel1 === context
          catlevel1_path(context)
        elsif Catlevel2 === context
          catlevel2_path(context)
        else
          catlevel3_path(context)
        end
    end
end
