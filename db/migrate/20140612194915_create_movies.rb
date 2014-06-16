class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :rotten_id
      t.string :critics_score
      t.string :audience_score

      t.timestamps
    end
  end
end
