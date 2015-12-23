class Membership < ActiveRecord::Base
  ROLES = ["admin", "member"] # member is the default

  belongs_to :user
  belongs_to :group

  validates :user, presence: true, uniqueness: { scope: :group_id }
  validates :group, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }

  scope :members, -> { where(role: "member") }
  scope :admins, -> { where(role: "admin") }
end
