class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :grombll_home
  before_action :configure_permitted_parameters, if: :devise_controller?
  #skip_before_action :authenticate_admin!, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:avarta, :remove_avarta, :avarta_cache, :first_name, :last_name, :address,:phone, :state,:city, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
	devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:avarta, :remove_avarta, :avarta_cache, :first_name, :last_name, :address,:phone, :state,:city,:email, :password, :current_password, :remember_me)}
  end

    def grombll_home
  	@categories = Category.all
  	@catlevel1s = Catlevel1.all
  	@catlevel2s = Catlevel2.all
  	@catlevel3s = Catlevel3.all
  	@agencies = Agency.all
  	@grumbles = Grumble.all
  	@grumblers = Grumbler.all
  	@companies = Company.all
    if user_signed_in?
        if current_user.grumbler? || current_user.company?
            @grumbles1 = current_user.grumbles
        end
        if current_user.agency?
            @grumbles2 = current_user.category.grumbles
        end
     end
  end
end
