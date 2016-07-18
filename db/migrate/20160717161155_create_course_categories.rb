class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
    	t.string :category, null: false
    	t.string :sub_category, null: false
    	t.string :speciality
    	t.string :ancestry, index: true
      t.timestamps null: false
    end
  end
end
