class AddImageUrlToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :main_image, :string
    add_column :characters, :negative_image, :string
    add_column :characters, :positive_image, :string
  end
end
