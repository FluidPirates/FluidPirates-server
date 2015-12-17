class CreateDelegations < ActiveRecord::Migration
  def change
    create_table :delegations do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :delegate, null: false, index: true, foreign_key: true
      t.references :category, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
