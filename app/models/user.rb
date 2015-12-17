class User < ActiveRecord::Base
  has_secure_password

  has_many :invitations
  has_many :delegations
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
end
