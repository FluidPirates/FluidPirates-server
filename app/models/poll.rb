class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :propositions
  has_many :choices, through: :propositions
  has_many :votes, through: :choices

  def open?
    open_at < Date.current && Date.current < close_at
  end

  def closed?
    !open?
  end
end
