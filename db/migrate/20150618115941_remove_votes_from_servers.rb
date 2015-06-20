class RemoveVotesFromServers < ActiveRecord::Migration
  def change
    remove_column :servers, :votes, :integer
  end
end
