class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   :title, null: false
      t.string   :bg_img, null: false
      t.string   :color, null: false
      t.text     :description, null: false
      t.string   :number, null: false
      t.string   :level, null: false
      t.string   :original_course_link, null: false
      t.string   :teacher, null: false
      t.string   :category, null: false
      t.string   :sub_category, null: false
      t.string   :speciality
      t.datetime :date_of_creating, null: false

      t.timestamps null: false
    end
  end
end
