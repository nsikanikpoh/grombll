class Comment < ApplicationRecord
	belongs_to :grumble, foreign_key: :grumble_id
	belongs_to :commenter, polymorphic: true
	mount_uploader :attachment, AttachmentUploader
end
