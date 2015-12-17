FactoryGirl.define do
  factory :delegation do
    user
    delegate { create(:user) }
    category
  end
end
