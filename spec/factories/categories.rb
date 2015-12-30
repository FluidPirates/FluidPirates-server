FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department(5) }
    description { Faker::Company.bs }
    group
  end
end
