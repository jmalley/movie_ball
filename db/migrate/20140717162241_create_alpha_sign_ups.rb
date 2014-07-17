class CreateAlphaSignUps < ActiveRecord::Migration
  def change
    create_table :alpha_sign_ups do |t|
      t.string :email

      t.timestamps
    end
  end
end
