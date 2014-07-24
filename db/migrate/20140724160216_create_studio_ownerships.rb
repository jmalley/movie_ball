class CreateStudioOwnerships < ActiveRecord::Migration
  def change
    create_table :studio_ownerships do |t|
      t.belongs_to :user
      t.belongs_to :studio
      t.timestamps
    end
  end
end
