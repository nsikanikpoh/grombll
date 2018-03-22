class Admin < User
 	has_many :comments, as: :commenter, foreign_key: :commenter_id
 	mount_uploader :avarta, AvartaUploader
end
