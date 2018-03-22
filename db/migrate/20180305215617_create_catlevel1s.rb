class CreateCatlevel1s < ActiveRecord::Migration[5.1]
  def change
    create_table :catlevel1s do |t|
      t.string :name
      t.text :info
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
