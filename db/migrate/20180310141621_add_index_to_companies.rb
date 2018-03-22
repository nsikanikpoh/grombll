class AddIndexToCompanies < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :sublevel_id, :integer 
  	add_column :users, :sublevel_type, :string
  	add_index(:users, [:sublevel_type, :sublevel_id])
  end
end
