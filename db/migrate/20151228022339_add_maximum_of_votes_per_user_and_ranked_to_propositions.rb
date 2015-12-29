class AddMaximumOfVotesPerUserAndRankedToPropositions < ActiveRecord::Migration
  def change
    add_column :propositions, :maximum_of_votes_per_user, :integer, default: 1
    add_column :propositions, :ranked, :boolean, default: false
  end
end
