class AddStatsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :nominations, :integer
    add_column :movies, :wins, :integer
    add_column :movies, :actor_nominations, :integer
    add_column :movies, :actor_wins, :integer
    add_column :movies, :release_date, :date
    add_column :movies, :industry_notes, :text
    add_column :movies, :per_theater_avg, :integer
    add_column :movies, :roeper_score, :string
    add_column :movies, :stubbed_by, :integer
  end
end
