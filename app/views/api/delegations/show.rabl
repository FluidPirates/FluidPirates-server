object @delegation

attributes :id

child :delegator do
  extends "api/users/show"
end

child :delegate do
  extends "api/users/show"
end

child :category do
  extends "api/categories/show"
end
