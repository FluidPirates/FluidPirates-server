class Delegation < ActiveRecord::Base
  belongs_to :category
  # user: The person who delegates
  belongs_to :user
  # delegate: The person who receives the delegation
  belongs_to :delegate, class_name: "User", foreign_key: "delegate_id"

  validates :category, presence: true
  validates :user, presence: true, uniqueness: { scope: :category_id }
  validates :delegate, presence: true

  def group
    category.group
  end
end
