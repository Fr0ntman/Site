class CoursesController < ApplicationController
	def index
		@courses = Course.find_each
	end

	def show
		course = Course.find params[:id]
		@exams = course.exams
		@lectures = course.lectures
		@tasks = course.tasks
	end
end
