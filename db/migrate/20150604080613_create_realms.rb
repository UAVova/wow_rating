class CreateRealms < ActiveRecord::Migration
  def change
    create_table :realms do |t|
      t.integer :server_id
      t.string :name
      t.text :description
      t.string :rates
      t.integer :realm_type_id
      t.integer :online
      t.date :creation_date
      t.integer :version

      t.timestamps null: false
    end
  end
end
