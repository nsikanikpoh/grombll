class AddCompanyIdToGrumbles < ActiveRecord::Migration[5.1]
  def change
    add_reference :grumbles, :company, foreign_key: true
  end
end
