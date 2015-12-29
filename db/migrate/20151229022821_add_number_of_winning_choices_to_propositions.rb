class AddNumberOfWinningChoicesToPropositions < ActiveRecord::Migration
  def change
    add_column :propositions, :number_of_winning_choices, :integer, default: 1
  end
end
