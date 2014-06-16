class AddRottenMovie < ActiveResource::Migration
  def change
    create_table :add_rotten_movie do |t|
      t.integer :rotten_id
    end
  end
end
