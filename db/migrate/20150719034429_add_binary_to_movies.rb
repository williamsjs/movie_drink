class AddBinaryToMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :poster
    add_column :movies, :poster, :binary
  end
end
