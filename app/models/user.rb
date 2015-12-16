class User < ActiveRecord::Base
  has_secure_password

  has_many :invitations
  has_many :delegations
  has_many :polls
  has_many :votes
  has_many :tokens
  has_many :memberships
  has_many :groups, through: :memberships

  def token
    tokens.valid.last.try(:value) || Token.create_for_user(self)
  end

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
