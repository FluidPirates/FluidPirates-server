class AddUserToPropositions < ActiveRecord::Migration
  def change
    add_reference :propositions, :user, index: true
  end
end
