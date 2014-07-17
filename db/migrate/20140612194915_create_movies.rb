class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category
      t.string :description
      t.integer :rotten_id
      t.integer :critics_score
      t.integer :audience_score
      t.integer :user_id

      t.timestamps
    end

  end

end
