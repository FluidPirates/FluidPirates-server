class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :group, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
