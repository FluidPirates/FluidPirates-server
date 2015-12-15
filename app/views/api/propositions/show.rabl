object @proposition

attributes :id, :name, :description

child :choices do
  extends "api/choices/show"
end
