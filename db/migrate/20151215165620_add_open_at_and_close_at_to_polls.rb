class AddOpenAtAndCloseAtToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :open_at, :datetime
    add_column :polls, :close_at, :datetime
  end
end
