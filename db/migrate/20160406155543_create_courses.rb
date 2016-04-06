class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :title, null: false
    	t.string :description, null: false
    	t.string :number, null: false
    	t.string :level, null: false
    	t.string :original_course, null: false
    	t.string :teacher, null: false
    	t.string :category, null: false
    	t.string :sub_category, null: false
    	t.string :speciality
    	t.datetime :created_date, null: false
      t.timestamps null: false
    end
  end
end
