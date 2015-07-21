class CreateBeerQuotes < ActiveRecord::Migration
  def change
    create_table :beer_quotes do |t|
      t.text :quote
      t.integer :character_id
      t.boolean :positive

      t.timestamps null: false
    end
  end
end
