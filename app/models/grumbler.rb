class Grumbler < User	
 	
 	has_many :grumbles
 	has_many :comments, as: :commenter, foreign_key: :commenter_id
 	mount_uploader :avarta, AvartaUploader
end
