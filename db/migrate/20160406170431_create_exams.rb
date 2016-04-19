class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
    	t.belongs_to :course, index: true
    	t.integer    :number, null: false
    	t.string     :title, null: false
    	t.json       :exams, null: false
    	t.json       :answers
      t.timestamps null: false
    end
  end
end
