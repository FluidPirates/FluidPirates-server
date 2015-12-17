class Proposition < ActiveRecord::Base
  belongs_to :poll

  has_many :choices
  has_many :votes, through: :choices

  validates :poll, presence: true
  validates :name, presence: true

  def category
    poll.category
  end

  def group
    category.group
  end
end
