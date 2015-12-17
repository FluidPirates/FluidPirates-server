class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name, null: false
      t.references :proposition, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
