object @group

attributes :name, :description, :users_count

child :categories do
  extends "api/categories/show"
end

child :polls do
  extends "api/polls/show"
end
