class Proposition < ActiveRecord::Base
  belongs_to :poll

  has_many :choices
  has_many :votes, through: :choices
  has_many :voters, through: :votes, source: :user

  validates :poll, presence: true
  validates :name, presence: true

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

  def voters_count
    return unless poll.ended?
    voters.size
  end

  def winning_choices
    return unless poll.ended?
    sorted_choices.first(number_of_winning_choices)
  end

  def sorted_choices
    return unless poll.ended?
    choices.sort_by(&:votes_power).reverse
  end
end
