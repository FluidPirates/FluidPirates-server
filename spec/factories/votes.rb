FactoryGirl.define do
  factory :vote do
    user
    choice
    rank nil

    factory :ranked_vote do
      rank 1
    end
  end
end
