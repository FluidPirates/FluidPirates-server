class Choice < ActiveRecord::Base
  belongs_to :proposition

  has_many :votes

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
end
