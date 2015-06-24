class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :server_id
      t.float :rating

      t.timestamps null: false
    end
  end
end
