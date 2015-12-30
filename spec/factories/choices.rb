FactoryGirl.define do
  factory :choice do
    name { Faker::Company.bs }
    proposition
  end
end
