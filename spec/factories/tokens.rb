FactoryGirl.define do
  factory :token do
    value { SecureRandom.hex }
    expires_at "2020-12-14 13:34:38"
    user
  end
end
