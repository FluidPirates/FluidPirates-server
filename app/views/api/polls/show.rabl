object @poll

attributes :name, :description

child :propositions do
  extends "api/propositions/show"
end
