class Membership < ActiveRecord::Base
  ROLES = ["admin", "member"]

  belongs_to :user
  belongs_to :group
end
