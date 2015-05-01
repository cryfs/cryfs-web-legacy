class CreateInterestedUsers < ActiveRecord::Migration
  def change
    create_table :interested_users do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
