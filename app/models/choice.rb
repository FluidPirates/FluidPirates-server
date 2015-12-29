class Choice < ActiveRecord::Base
  belongs_to :proposition

  has_many :votes
  has_many :voters, through: :votes, source: :user

  validates :name, presence: true, uniqueness: { scope: :proposition_id }
  validates :proposition, presence: true

  def poll
    proposition.poll
  end

  def category
    poll.category
  end

  def group
    category.group
  end

  def votes_count
    return unless poll.ended?
    votes.size
  end

  def votes_power
    return unless poll.ended?
    votes.to_a.sum(&:power)
  end

  def voters_count
    return unless poll.ended?
    voters.size
  end

  def percent_of_total_votes
    return unless poll.ended?
    100 * votes_count / proposition.votes_count
  end

  def percent_of_voters
    return unless poll.ended?
    100 * voters_count / proposition.voters_count
  end
end
