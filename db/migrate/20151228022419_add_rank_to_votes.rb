class AddRankToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :rank, :integer
  end
end
