object @proposition

attributes :name, :description, :user_id

child :choices do
  extends "api/choices/show"
end
