class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :server_id
      t.integer :user_id
      t.text :positive
      t.text :negative
      t.text :comment
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
