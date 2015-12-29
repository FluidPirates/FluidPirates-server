FactoryGirl.define do
  factory :proposition, aliases: [:single_choice_proposition] do
    name { "Proposition #{generate :n}" }
    description "Proposition description"
    maximum_of_votes_per_user 1
    ranked false
    number_of_winning_choices 1
    poll

    factory :multiple_choices_proposition do
      maximum_of_votes_per_user 3
      number_of_winning_choices 2
    end

    factory :ranked_multiple_choices_proposition do
      maximum_of_votes_per_user 3
      ranked true
    end
  end
end
