class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :surname
      t.string :avatar
      t.integer :role
      t.string :birthday
      t.string :last_ip
      t.string :reg_ip

      t.timestamps null: false
    end
  end
end
