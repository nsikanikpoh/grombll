class CreateGrumbles < ActiveRecord::Migration[5.1]
  def change
    create_table :grumbles do |t|
      t.string :file
      t.integer :status
      t.string :company_name
      t.text :complain
      t.integer :category_id
      t.string :city
      t.string :state
      t.date :date
      
      t.integer :agency_id
    

      t.timestamps
    end
  end
end
