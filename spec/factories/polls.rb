FactoryGirl.define do
  factory :poll do
    name { "Poll #{generate :n}" }
    description "Poll description"
    user
    category
  end
end
