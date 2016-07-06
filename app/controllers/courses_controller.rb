class CoursesController < ApplicationController
	def specialities
		@specialities = {}
		@categories = Category.all
		@categories.each do |category|
			@specialities[:"#{category.id}"] = {title: category.title, specialities: []}
			category.sub_categories.each do |sub_category|
				sub_category.specialities.each do |speciality|
					@specialities[:"#{category.id}"][:specialities] << speciality
				end
			end
		end
		@specialities.delete_if { |k, v| v[:specialities].empty? }
	end

	def speciality
		@courses = Course.where speciality: params[:speciality_id]
	end

	def topics		
	end

	def mit_courses
	end

	def index
		redirect_to specialities_courses_path
	end

	def show
		@course = Course.find params[:id]
	end

	def new
		@course = Course.new
		@categories = Category.all
	end

	def create
		@course = Course.new course_params
		respond_to do |format|
			if @course.save
				format.html { redirect_to @course }
			else
				format.html { render :new }
			end
		end
	end

	private

		def course_params
			params.require(:course).permit(
				:title, 
				:bg_img,
				:color, 
				:description, 
				:number, 
				:level, 
				:original_course_link, 
				:teacher, 
				:category, 
				:sub_category, 
				:speciality, 
				:date_of_creating
			)
		end
end
