class CreateServers < ActiveRecord::Migration
  def change
    create_table   :servers do |t|
      t.string     :title, :null => false
      t.string     :url,   :null => false
      t.text       :description
      t.float      :rating, default: 0, :null => false
      t.integer    :votes,  default: 0, :null => false
      t.string     :rates,  default: 0, :null => false
      t.attachment :image
      t.integer    :owner,  :null => false
    end
  end
end
