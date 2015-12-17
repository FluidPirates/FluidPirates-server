class ActiveRecord::Base
  def full_error_messages
    errors.full_messages.join(", ")
  end
end
