class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice

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
end
