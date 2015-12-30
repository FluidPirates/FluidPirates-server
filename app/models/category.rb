class Category < ActiveRecord::Base
  belongs_to :group

  has_many :delegations
  has_many :polls
  has_many :propositions, through: :polls
  has_many :choices, through: :polls
  has_many :votes, through: :choices

  validates :name, presence: true, uniqueness: { scope: :group_id }
  validates :group, presence: true

  def delegates_without_parent_delegates
    group.users - delegations.select(&:has_parent_delegation).map(&:delegator).uniq
  end

  def to_s
    "Category##{id} - #{name}"
  end
end
