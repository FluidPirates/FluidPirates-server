object @poll

attributes :id, :name, :description, :created_at
attributes :open_at, :closed_at, :open?, :closed?

child :propositions do
  extends "api/propositions/show"
end
