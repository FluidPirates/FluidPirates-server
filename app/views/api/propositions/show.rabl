object @proposition

attributes :id, :name, :description
attributes :maximum_of_votes_per_user, :ranked
attributes :number_of_winning_choices
attributes :votes_count, :voters_count

child :winning_choices do
  extends "api/choices/show"
end

child :choices do
  extends "api/choices/show"
end
