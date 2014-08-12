class AddLeagueIdToStudioOwnership < ActiveRecord::Migration
  def change
    add_column :studio_ownerships, :league_id, :integer
  end
end
