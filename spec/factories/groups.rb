FactoryGirl.define do
  factory :group do
    name { Faker::University.name + " " + rand(10).to_s }
    description { Faker::Company.catch_phrase }
    domain nil

    factory :group_with_domain do
      domain "example.com"
    end
  end
end
