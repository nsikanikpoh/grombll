class Category < ApplicationRecord
	
	has_many :catlevel1s
	has_many :catlevel2s
	has_many :catlevel3s
	has_many :companies
	has_many :agencies
	has_many :grumbles
  	

end
