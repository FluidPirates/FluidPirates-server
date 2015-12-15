class RenameDelegationUserFields < ActiveRecord::Migration
  def change
    rename_column :delegations, :representative_id, :delegate_id
    rename_column :delegations, :delegee_id, :user_id
  end
end
