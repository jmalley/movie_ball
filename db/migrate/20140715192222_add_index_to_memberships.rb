class AddIndexToMemberships < ActiveRecord::Migration
  def change
    add_index :memberships, [:league_id, :user_id], unique: true
    add_index :memberships, :user_id
  end
end
