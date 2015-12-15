class RemoveUserForPropositions < ActiveRecord::Migration
  def change
    remove_column :propositions, :user_id
  end
end
