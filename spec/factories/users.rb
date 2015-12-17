FactoryGirl.define do
  factory :user, aliases: [:delegate] do
    name "John Doe"
    email { "john.doe.#{generate :n}@example.com" }
    password "correct-password"
  end
end
