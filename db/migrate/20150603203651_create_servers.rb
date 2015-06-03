class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :title
      t.string :url
      t.text :description
      t.float :rating
      t.integer :votes
      t.string :rates
      t.attachment :image
    end
  end
end
