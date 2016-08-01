class CoursesController < ApplicationController
	layout :resolve_layout

	def specialities
		@specialities = []
		@categories = CourseCategory.all
		@categories.each do |item|
			if item.has_children?
				descendants = item.descendants(from_depth: 2)
				@specialities << {parent: item, specialities: descendants}
			end
		end
		@specialities.delete_if { |item| item[:specialities].empty? }
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
		@speciality = CourseCategory.find @course.speciality
		@similar_courses = Course.where(speciality: @speciality.id).take(4)
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

		def resolve_layout
      case action_name
      when "show"
        "course"
      else
        "application"
      end
    end
end
