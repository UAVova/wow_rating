class CreateWowPatches < ActiveRecord::Migration
  def change
    create_table :wow_patches do |t|
      t.string :title
      t.text :description
    end
  end
end
