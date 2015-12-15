class Delegation < ActiveRecord::Base
  belongs_to :category
  # user: The person who delegates
  belongs_to :user
  # delegate: The person who receives the delegation
  belongs_to :delegate, class_name: "User", foreign_key: "user_id"

  def full_error_messages
    errors.full_messages.join(", ")
  end
end
