class LecturesController < ApplicationController
	layout 'course'

	def show
		@course = Course.find params[:course_id]
		@lecture = @course.lectures.find params[:id]
		@speciality = CourseCategory.find @course.speciality
		@similar_courses = Course.where(speciality: @speciality.id).take(4)
	end
end
