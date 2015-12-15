class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :propositions
  has_many :choices, through: :propositions
  has_many :votes, through: :choices

  def open?
    return false if open_at && open_at > Date.current
    return false if close_at && close_at < Date.current
    return true
  end

  def closed?
    !open?
  end
end
