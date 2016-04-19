class Course < ActiveRecord::Base
	has_many :lectures
	has_many :tasks
	has_many :exams
end
