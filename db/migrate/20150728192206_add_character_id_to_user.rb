class AddCharacterIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :character_idr, :string
  end
end
