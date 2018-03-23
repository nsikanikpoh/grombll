class GrombllHomeController < ApplicationController
  def grombll_home
  	@categories = Category.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@catlevel1s = Catlevel1.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@catlevel2s = Catlevel2.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@catlevel3s = Catlevel3.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@agencies = Agency.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@grumbles = Grumble.all.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
  	if user_signed_in?
          if current_user.grumbler? || current_user.company?
              @grumbles1 = current_user.grumbles.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
          end
          if current_user.agency?
            @grumbles2 = current_user.category.grumbles
        end
  end
    @grumblers = Grumbler.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  	@companies = Company.all.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
  

    @companies.each do |company|

        if company.first_name == "Base Company"

          @company = company
        end
    end
    return @company  
  

  end

  def user_grumbles
    @grumbles = current_user.grumbles.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end
  def agency_grumbles
    @grumbles = current_user.category.grumbles.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
  end
end
