class User < ActiveRecord::Base
  has_secure_password

  has_many :invitations
  has_many :delegators_delegations, class_name: "Delegation", foreign_key: :delegator_id
  has_many :delegators, through: :delegators_delegations, source: :delegator
  has_many :delegates_delegations, class_name: "Delegation", foreign_key: :delegate_id
  has_many :delegates, through: :delegates_delegations, source: :delegate
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

  # Voting power = 1 + voting power of delegators who didn't cast their votes
  def voting_power_for_proposition(proposition)
    delegators = delegators_delegations.where(category: proposition.category).map(&:delegator)
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
