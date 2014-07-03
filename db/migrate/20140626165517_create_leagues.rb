class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :game_type
      t.string :logo

      t.timestamps
    end
  end
end
