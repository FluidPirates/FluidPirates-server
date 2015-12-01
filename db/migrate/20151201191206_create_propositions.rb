class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.string :name
      t.references :poll, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
