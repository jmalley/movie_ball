class CreateStudioOwnerships < ActiveRecord::Migration
  def change
    create_table :studio_ownerships do |t|

      t.timestamps
    end
  end
end
