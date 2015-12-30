class User < ActiveRecord::Base
  has_secure_password

  has_many :invitations
  has_many :polls
  has_many :votes
  has_many :tokens
  has_many :memberships
  has_many :groups, through: :memberships

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def token
    tokens.valid.last.try(:value) || Token.create_for_user(self)
  end

  def email_domain
    email.split("@").last
  end

  def delegators_for_category(category)
    Delegation.where(delegate: self, category: category).map(&:delegator)
  end

  # Voting power = 1 + voting power of delegators who didn't cast their votes
  def voting_power_for_proposition(proposition)
    delegators = delegators_for_category(proposition.category)
    delegators = delegators.reject { |delegator| delegator.voted_for?(proposition) }
    1 + delegators.sum { |delegator| delegator.voting_power_for_proposition(proposition) }
  end

  def voted_for?(proposition)
    proposition.voters.include?(self)
  end

  def to_s
    "User##{id} - #{name}"
  end
end
