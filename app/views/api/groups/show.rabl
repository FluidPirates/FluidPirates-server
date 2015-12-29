object @group

attributes :id, :name, :description, :domain
attributes :users_count

child :categories do
  extends "api/categories/show"
end

child :polls do
  extends "api/polls/show"
end
