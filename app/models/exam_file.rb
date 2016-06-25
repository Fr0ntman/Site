class ExamFile < ActiveRecord::Base
	belongs_to :exam
	has_one    :answer_file
end
