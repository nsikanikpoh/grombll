class AddCommentableToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :grumble_id, :integer
  	
  end
end
