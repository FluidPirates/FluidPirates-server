class Token < ActiveRecord::Base
  belongs_to :user

  EXPIRATION_PERIOD = 1.month

  def self.create_for_user(user)
    Token.create(user: user, value: SecureRandom.hex, expires_at: EXPIRATION_PERIOD.from_now).value
  end

  def expired?
    expires_at < Date.current
  end
end
