class Delegation < ActiveRecord::Base
  belongs_to :category
  belongs_to :delegator, class_name: "User", foreign_key: "delegator_id"
  belongs_to :delegate, class_name: "User", foreign_key: "delegate_id"

  validates :category, presence: true
  validates :delegator, presence: true, uniqueness: { scope: :category_id }
  validates :delegate, presence: true

  def group
    category.group
  end

  def has_parent_delegation
    Delegation.where(delegator: delegate, category: category).any?
  end

  def to_s
    "Delegation##{id} (#{category.name}): #{delegator} -> #{delegate}"
  end
end
