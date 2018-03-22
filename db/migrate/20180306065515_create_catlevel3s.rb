class CreateCatlevel3s < ActiveRecord::Migration[5.1]
  def change
    create_table :catlevel3s do |t|
      t.string :name
      t.text :info
      t.references :category, foreign_key: true
      t.references :catlevel2, foreign_key: true
      t.integer :catlevel1_id

      t.timestamps
    end
  end
end
