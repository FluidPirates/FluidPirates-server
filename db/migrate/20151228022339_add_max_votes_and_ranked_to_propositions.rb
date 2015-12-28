class AddMaxVotesAndRankedToPropositions < ActiveRecord::Migration
  def change
    add_column :propositions, :max_votes, :integer, default: 1
    add_column :propositions, :ranked, :boolean, default: false
  end
end
