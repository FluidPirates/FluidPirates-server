class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.references :category, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
