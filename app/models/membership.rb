class Membership < ActiveRecord::Base
  ROLES = [:admin, :member]

  validates :role, inclusion: { in: ROLES }

  belongs_to :user
  belongs_to :group
end
