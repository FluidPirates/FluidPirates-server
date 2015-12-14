class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships
  has_many :groups, through: :memberships

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
