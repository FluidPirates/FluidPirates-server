FactoryGirl.define do
  factory :invitation do
    email { "someone_#{generate :n}@example.com" }
    group
    key { SecureRandom.hex }
    user
  end
end
