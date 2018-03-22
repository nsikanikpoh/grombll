class Company < User
 	belongs_to :category, foreign_key: :category_id
 	belongs_to :sublevel, polymorphic: true
 	has_many :grumbles
 	has_many :comments, as: :commenter, foreign_key: :commenter_id
 	mount_uploader :avarta, AvartaUploader
end
