class Delegation < ActiveRecord::Base
  belongs_to :category
  belongs_to :delegator, class_name: "User", foreign_key: "delegator_id"
  belongs_to :delegatee, class_name: "User", foreign_key: "delegatee_id"

  validates :category, presence: true
  validates :delegator, presence: true, uniqueness: { scope: :category_id }
  validates :delegatee, presence: true

  def group
    category.group
  end
end
