class ExamsController < ApplicationController
	layout 'course'

	def show
		@course = Course.find params[:course_id]
		@exam = @course.exams.find params[:id]
		@speciality = Speciality.find @course.speciality
		@similar_courses = Course.where(speciality: @speciality.id).take(4)
	end
end
