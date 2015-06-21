class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
