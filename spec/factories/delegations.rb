FactoryGirl.define do
  factory :delegation do
    delegate { create(:user) }
    delegator { create(:user) }
    category
  end
end
