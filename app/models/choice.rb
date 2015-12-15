class Choice < ActiveRecord::Base
  belongs_to :proposition

  has_many :votes
end
