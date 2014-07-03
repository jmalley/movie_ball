class AddOwnerIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :owner_id, :integer
  end
end
