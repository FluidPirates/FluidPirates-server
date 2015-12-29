class User < ActiveRecord::Base
  has_secure_password

  has_many :invitations
  has_many :delegators_delegations, class_name: "Delegation", source: :delegator
  has_many :delegators, through: :delegators_delegations
  has_many :delegatees_delegations, class_name: "Delegation", source: :delegatee
  has_many :delegatees, through: :delegatees_delegations
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
end
