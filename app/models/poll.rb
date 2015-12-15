class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :propositions
  has_many :choices, through: :propositions
  has_many :votes, through: :choices
end
