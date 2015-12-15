object @membership

attributes :id, :role

child :user do
  extends "api/users/show"
end
