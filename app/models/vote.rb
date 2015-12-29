class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  has_one :proposition, through: :choice
  has_one :poll, through: :proposition
  has_one :category, through: :poll
  has_one :group, through: :category

  validates :user, presence: true
  validates :choice, presence: true

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
  def power
    return 1 unless rank
    (proposition.maximum_of_votes_per_user - rank + 1) * 2
  end
end
