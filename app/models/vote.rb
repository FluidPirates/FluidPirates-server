class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice

  validates :user, presence: true
  validates :choice, presence: true
end
