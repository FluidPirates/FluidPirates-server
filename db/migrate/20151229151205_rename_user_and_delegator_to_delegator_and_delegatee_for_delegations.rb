class RenameUserAndDelegatorToDelegatorAndDelegateeForDelegations < ActiveRecord::Migration
  def change
    rename_column :delegations, :delegate_id, :delegatee_id
    rename_column :delegations, :user_id, :delegator_id
  end
end
