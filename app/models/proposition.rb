class Proposition < ActiveRecord::Base
  belongs_to :poll

  has_many :choices
  has_many :votes, through: :choices
end
