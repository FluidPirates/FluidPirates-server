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

  def users_count
    users.size
  end

  def add_admin(user)
    memberships.create!(user: user, role: "admin")
  end
end
