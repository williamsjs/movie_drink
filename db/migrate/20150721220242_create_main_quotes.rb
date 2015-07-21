class CreateMainQuotes < ActiveRecord::Migration
  def change
    create_table :main_quotes do |t|
      t.text :quote
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
