class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :value, null: false
      t.datetime :expires_at, null: false
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
