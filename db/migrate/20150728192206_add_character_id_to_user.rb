class AddCharacterIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :character_id, :string
  end
end
