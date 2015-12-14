class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
