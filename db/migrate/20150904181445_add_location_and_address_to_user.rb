class AddLocationAndAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :address, :string
  end
end
