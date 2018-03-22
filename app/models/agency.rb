class Agency < User
 	belongs_to :category, foreign_key: :category_id
 	has_many :comments, as: :commenter, foreign_key: :commenter_id
 	has_many :companies, :through => :category
 	has_many :grumbles, :through => :category
 	mount_uploader :avarta, AvartaUploader
 	
end
