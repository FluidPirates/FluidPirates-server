object @proposition

attributes :name, :description

child :choices do
  extends "api/choices/show"
end
