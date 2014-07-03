class AddLeagueIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :league_id, :integer
  end
end
