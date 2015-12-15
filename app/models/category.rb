class Category < ActiveRecord::Base
  has_many :delegations
  has_many :polls
  has_many :propositions, through: :polls
  has_many :choices, through: :polls
  has_many :votes, through: :choices

  belongs_to :group

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
