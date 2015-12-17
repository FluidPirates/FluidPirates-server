class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :choice, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
