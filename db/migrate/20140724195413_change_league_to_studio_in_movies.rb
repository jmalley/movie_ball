class ChangeLeagueToStudioInMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :league_id, :studio_id
  end
end
