class RottenMovies < ActiveRecord::Migration
  def change
    create_table :rotten_movies do |t|
      t.integer :nominations
      t.integer :wins
      t.integer :actor_nominations
      t.integer :actor_wins
      t.integer :release_date
      t.text    :industry_notes
      t.integer :per_theater_avg
      t.integer :roeper_score

      t.timestamps
    end
  end
end
