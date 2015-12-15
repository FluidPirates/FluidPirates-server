class Category < ActiveRecord::Base
  has_many :delegations
  has_many :polls
  belongs_to :group

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
