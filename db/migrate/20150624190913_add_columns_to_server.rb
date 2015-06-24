class AddColumnsToServer < ActiveRecord::Migration
  def change
    add_column :servers, :votes_count, :integer, :default => 0

    Server.reset_column_information
    Server.all.each do |s|
      s.update_attribute :votes_count, s.votes.length
    end
  end
end
