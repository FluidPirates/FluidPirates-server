class AddDescriptionToModels < ActiveRecord::Migration
  def change
    add_column :groups, :description, :text, default: ""
    add_column :propositions, :description, :text, default: ""
    add_column :polls, :description, :text, default: ""
  end
end
