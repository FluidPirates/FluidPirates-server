FactoryGirl.define do
  factory :membership do
    user
    group
    role "member"

    factory :admin_membership do
      role "admin"
    end
  end
end
