FactoryGirl.define do
  factory :proposition do
    name { "Proposition #{generate :n}" }
    description "Proposition description"
    poll
  end
end
