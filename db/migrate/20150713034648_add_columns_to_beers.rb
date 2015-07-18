class AddColumnsToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :abv, :string
    add_column :beers, :description, :text
    add_column :beers, :url_image, :string
    add_column :beers, :style, :string
    add_column :beers, :location, :string
  end
end
