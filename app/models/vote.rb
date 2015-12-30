class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  has_one :proposition, through: :choice
  has_one :poll, through: :proposition
  has_one :category, through: :poll
  has_one :group, through: :category

  validates :user, presence: true, uniqueness: { scope: :choice_id }
  validates :choice, presence: true
  validate :respect_the_proposition_maximum_of_votes_per_user
  validate :votes_in_an_open_poll
  validate :rank_is_valid

  def proposition
    choice.proposition
  end

  def poll
    proposition.poll
  end

  def category
    poll.category
  end

  def group
    category.group
  end

  # In a ranked proposition, the voters can rank their votes (1 to N).
  # Vote power = voting power of the voter * inverse of rank
  def power
    voting_power = user.voting_power_for_proposition(proposition)
    voting_power * (proposition.maximum_of_votes_per_user - rank + 1)
  end

  private

  def respect_the_proposition_maximum_of_votes_per_user
    max_votes = proposition.maximum_of_votes_per_user

    if proposition.votes.where(user: user).size >= max_votes
      errors.add(:choice, "proposition already has #{max_votes} votes")
    end
  end

  def votes_in_an_open_poll
    if poll.closed?
      errors.add(:choice, "poll is closed")
    end
  end

  def rank_is_valid
    max_votes = proposition.maximum_of_votes_per_user

    if rank && (rank.to_i < 0 || rank.to_i > max_votes)
      errors.add(:rank, "is not between 1 and #{max_votes}")
    end
  end
end
