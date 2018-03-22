class CreateCatlevel2s < ActiveRecord::Migration[5.1]
  def change
    create_table :catlevel2s do |t|
      t.string :name
      t.text :info
      t.references :category, foreign_key: true
      t.references :catlevel1, foreign_key: true

      t.timestamps
    end
  end
end
