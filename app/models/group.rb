class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :categories
  has_many :polls, through: :categories
  has_many :propositions, through: :polls
  has_many :choices, through: :propositions
  has_many :votes, through: :choices

  before_validation :set_memberships_defaults

  def users_count
    users.size
  end

  def add_admin(user)
    memberships.create(user: user, role: "admin")
  end

  def full_error_messages
    errors.full_messages.join(", ")
  end

  private

  def set_memberships_defaults
    memberships.map(&:set_defaults)
  end
end
