FactoryGirl.define do
  factory :vote do
    user
    choice
    rank nil

    factory :ranked_vote do
      rank { generate(:i) }
    end
  end
end
