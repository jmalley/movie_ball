class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.string :logo
      t.integer :league_id

      t.timestamps
    end
  end
end
