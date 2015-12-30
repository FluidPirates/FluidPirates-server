class AddDefaultToVotesRank < ActiveRecord::Migration
  def change
    change_column :votes, :rank, :integer, default: 1
  end
end
