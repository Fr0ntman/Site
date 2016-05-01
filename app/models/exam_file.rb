class ExamFile < ActiveRecord::Base
	belongs_to :exam
	has_one    :answe_file
end
