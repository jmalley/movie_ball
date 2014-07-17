class ChangeRottenIdFormatInMovieTable < ActiveRecord::Migration
  def change
    change_column :movies, :rotten_id, :integer
  end
end
