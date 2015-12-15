FactoryGirl.define do
  factory :group do
    name { "Group #{generate :n}" }
    description "Group description"
  end
end
