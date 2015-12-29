object @delegation

attributes :id

child :delegator do
  extends "api/users/show"
end

child :delegatee do
  extends "api/users/show"
end

child :category do
  extends "api/categories/show"
end
