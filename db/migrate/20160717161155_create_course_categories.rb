class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
    	t.string :title
    	t.string :ancestry, index: true
      t.timestamps null: false
    end
  end
end
