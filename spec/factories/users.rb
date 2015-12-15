FactoryGirl.define do
  factory :user, aliases: [:delegate] do
    name "John Doe"
    email "john.doe@example.com"
    password "correct-password"
  end
end
