class Delegation < ActiveRecord::Base
  belongs_to :delegee
  belongs_to :representative
  belongs_to :category
end
