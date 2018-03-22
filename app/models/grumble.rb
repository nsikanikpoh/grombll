class Grumble < ApplicationRecord
	enum status: [:Pending, :Approved, :Rectified, :Satisfied]
	belongs_to :category, foreign_key: :category_id
	belongs_to :company, foreign_key: :company_id
	belongs_to :grumbler, foreign_key: :grumbler_id
	has_many :comments
	mount_uploader :file, FileUploader
end
