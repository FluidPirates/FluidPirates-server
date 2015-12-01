class CreateDelegations < ActiveRecord::Migration
  def change
    create_table :delegations do |t|
      t.references :delegee, index: true, foreign_key: true
      t.references :representative, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
