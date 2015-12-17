class Group < ActiveRecord::Base
  has_many :invitations
  has_many :memberships
  has_many :users, through: :memberships
  has_many :categories
  has_many :polls, through: :categories
  has_many :propositions, through: :polls
  has_many :choices, through: :propositions
  has_many :votes, through: :choices

  validates :name, uniqueness: true, presence: true

  scope :with_includes, -> {
    includes(:categories, polls: { propositions: :choices })
  }

  def users_count
    users.size
  end

  def add_admin(user)
    memberships.create!(user: user, role: "admin")
  end

  def has_user?(user)
    !!memberships.find_by(user: user)
  end

  def has_member?(user)
    !!memberships.members.find_by(user: user)
  end

  def has_admin?(user)
    !!memberships.admins.find_by(user: user)
  end
end
