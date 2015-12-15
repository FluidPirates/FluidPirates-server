FactoryGirl.define do
  factory :choice do
    name { "Choice #{generate :n}" }
    proposition
  end
end
