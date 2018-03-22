class AddCompanyIdToGrumbles < ActiveRecord::Migration[5.1]
  def change
    add_column :grumbles, :company_id, :integer
  end
end
