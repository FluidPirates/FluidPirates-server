FactoryGirl.define do
  factory :poll, aliases: [:open_poll] do
    name { Faker::Company.buzzword }
    description { Faker::Company.bs }
    open_at "2000-12-14 13:34:38"
    close_at "2020-12-14 13:34:38"
    user
    category

    factory :closed_poll do
      open_at "2000-12-14 13:34:38"
      close_at "2001-12-14 13:34:38"
    end

    factory :future_poll do
      open_at "3000-12-14 13:34:38"
      close_at "3001-12-14 13:34:38"
    end
  end
end
