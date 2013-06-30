class ProblemType < ActiveRecord::Base
  attr_accessible :name
  has_many :problems
end
