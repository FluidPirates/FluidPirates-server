FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department }
    description { Faker::Company.bs }
    group
  end
end
