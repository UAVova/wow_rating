class CreateRealmTypes < ActiveRecord::Migration
  def change
    create_table :realm_types do |t|
      t.string :title
    end
  end
end
