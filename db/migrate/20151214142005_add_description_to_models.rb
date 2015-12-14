class AddDescriptionToModels < ActiveRecord::Migration
  def change
    add_column :groups, :description, :text
    add_column :propositions, :description, :text
    add_column :polls, :description, :text
  end
end
