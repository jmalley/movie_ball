class AddReferenceUserToMembership < ActiveRecord::Migration
  def change
    add_reference :memberships, :user
    add_reference :memberships, :league
  end
end
