class TaskFile < ActiveRecord::Base
	belongs_to :task
	has_one    :solution_file
end
