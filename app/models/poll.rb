class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :propositions
end
