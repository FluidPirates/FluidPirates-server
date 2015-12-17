class Token < ActiveRecord::Base
  belongs_to :user

  scope :valid, -> { where("expires_at > ?", Date.current) }

  EXPIRATION_PERIOD = 1.month

  validates :value, presence: true
  validates :user, presence: true
  validates :expires_at, presence: true

  def self.create_for_user(user)
    Token.create(user: user, value: SecureRandom.hex, expires_at: EXPIRATION_PERIOD.from_now).value
  end

  def expired?
    expires_at < Date.current
  end
end
