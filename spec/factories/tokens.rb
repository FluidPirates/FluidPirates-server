FactoryGirl.define do
  factory :token do
    value "965d19a13bf7a5630c548eaa01e7a0d5"
    expires_at "2020-12-14 13:34:38"
    user
  end
end
