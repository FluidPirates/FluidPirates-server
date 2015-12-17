class Membership < ActiveRecord::Base
  ROLES = ["admin", "member"]

  belongs_to :user
  belongs_to :group

  validates :user, presence: true, uniqueness: { scope: :group_id }
  validates :group, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
end
