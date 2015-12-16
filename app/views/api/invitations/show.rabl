object @invitation

attributes :id, :key, :email

child :user do
  extends "api/users/show"
end
