FactoryGirl.define do
  factory :delegation do
    delegatee { create(:user) }
    delegator { create(:user) }
    category
  end
end
