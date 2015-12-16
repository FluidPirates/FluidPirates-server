class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  def accept!(invited_user:)
    group.memberships.create!(user: invited_user, role: "member")
  end
end
