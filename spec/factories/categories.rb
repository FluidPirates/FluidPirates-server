FactoryGirl.define do
  factory :category do
    name { "Category #{generate :n}" }
    description "Category description"
    group
  end
end
