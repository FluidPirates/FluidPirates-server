FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{Faker::Internet.user_name}#{rand(100)}@example.com" }
    password "correct-password"
  end
end
