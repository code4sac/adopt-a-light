class Problem < ActiveRecord::Base
  attr_accessible :from_user_id, :problem_desc, :problem_type_id, :resolved, :sent, :thing_id, :to_user_id
  belongs_to :problem_type
  belongs_to :thing
end
