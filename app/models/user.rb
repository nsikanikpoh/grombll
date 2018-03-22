class User < ApplicationRecord


	  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    def company?

    	self.is_a?(Company) 
    end


    def admin?

    	self.is_a?(Admin) 
    end 

    def grumbler?

    	self.is_a?(Grumbler) 
    end

     def agency?

    	self.is_a?(Agency) 
    end

	 mount_uploader :avarta, AvartaUploader
end
