class AddColumnsToVote < ActiveRecord::Migration
  def change
    add_column :votes, :username, :string
  end
end
