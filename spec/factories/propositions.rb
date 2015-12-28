FactoryGirl.define do
  factory :proposition, aliases: [:single_choice_proposition] do
    name { "Proposition #{generate :n}" }
    description "Proposition description"
    max_votes 1
    ranked false
    poll

    factory :multiple_choices_proposition do
      max_votes 3
    end

    factory :ranked_multiple_choices_proposition do
      max_votes 3
      ranked true
    end
  end
end
