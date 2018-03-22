class AddIssueableReferencesFromGrumbles < ActiveRecord::Migration[5.1]
  def change
  	add_column :grumbles, :grumbler_id, :integer
  	
  end
end
