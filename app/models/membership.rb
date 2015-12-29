class Membership < ActiveRecord::Base
  ROLES = ["admin", "member"] # member is the default

  belongs_to :user
  belongs_to :group

  validates :user, presence: true, uniqueness: { scope: :group_id }
  validates :group, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
  validate :user_email_domain_is_group_domain

  scope :members, -> { where(role: "member") }
  scope :admins, -> { where(role: "admin") }

  private

  def user_email_domain_is_group_domain
    if domain && user.email_domain != domain
      errors.add(:user, "User's email must be \"#{domain}\"")
    end
  end
end
