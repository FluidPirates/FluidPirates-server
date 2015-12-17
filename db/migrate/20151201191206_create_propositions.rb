class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.string :name, null: false
      t.references :poll, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
