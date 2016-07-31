class TaskFile < ActiveRecord::Base
	mount_uploader :file, TaskFileUploader
	belongs_to :task
	has_ancestry
end
