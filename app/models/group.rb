class Group < ActiveRecord::Base
  has_many :categories
  has_many :memberships
  has_many :users, through: :memberships

  before_validation :set_memberships_defaults

  def users_count
    users.size
  end

  def full_error_messages
    errors.full_messages.join(", ")
  end

  private

  def set_memberships_defaults
    memberships.map(&:set_defaults)
  end
end
