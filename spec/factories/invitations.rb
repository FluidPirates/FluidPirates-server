FactoryGirl.define do
  factory :invitation do
    email { "#{Faker::Internet.user_name}@example.com" }
    group
    key { SecureRandom.hex }
    user
  end
end
