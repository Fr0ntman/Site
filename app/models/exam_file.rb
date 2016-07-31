class ExamFile < ActiveRecord::Base
	mount_uploader :file, ExamFileUploader
	belongs_to :exam
	has_ancestry
end
