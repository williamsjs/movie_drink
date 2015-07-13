class ChangeBeerColumnToMovieId < ActiveRecord::Migration
  def change
    add_column :beers, :movie_id, :integer
    remove_column :beers, :user_id
  end
end
