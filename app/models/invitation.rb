class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
  validates :email, presence: true, uniqueness: { scope: [:user_id, :group_id] }
  validates :key, presence: true, uniqueness: true

  def accept!(invited_user:)
    group.memberships.create!(user: invited_user, role: "member")
  end
end
