class AddStudioIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :studio_id, :integer
  end
end
