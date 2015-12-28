object @proposition

attributes :id, :name, :description, :max_votes, :ranked

child :choices do
  extends "api/choices/show"
end
