class RenameUserToDelegatorForDelegations < ActiveRecord::Migration
  def change
    rename_column :delegations, :user_id, :delegator_id
  end
end
