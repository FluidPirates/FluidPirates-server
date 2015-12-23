class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
  validates :email, presence: true, uniqueness: { scope: [:user_id, :group_id] }
  validates :key, presence: true, uniqueness: true
  before_validation :generate_key

  def accept!(invited_user:)
    group.memberships.create!(user: invited_user, role: "member")
  end

  private

  def generate_key
    self.key ||= SecureRandom.hex
  end
end
