FactoryGirl.define do
  factory :group do
    name { "Group #{generate :n}" }
    description "Group description"
    domain nil

    factory :group_with_domain do
      domain "example.com"
    end
  end
end
