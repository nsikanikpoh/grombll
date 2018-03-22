class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :avarta
      t.string :title
      t.string :sex
      t.string :phone
      t.string :type
      t.string :address
      t.text :info
      t.integer :category_id
      
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
