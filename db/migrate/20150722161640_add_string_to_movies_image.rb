class AddStringToMoviesImage < ActiveRecord::Migration
  def change
    remove_column :movies, :poster
    add_column :movies, :poster, :string
  end
end
