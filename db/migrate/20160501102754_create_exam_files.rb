class CreateExamFiles < ActiveRecord::Migration
  def change
    create_table :exam_files do |t|
    	t.belongs_to :exam, index: true
    	t.string     :title, null: false
    	t.integer    :number, null: false
    	t.string     :file, null: false
    	t.integer    :year, null: false

      t.timestamps null: false
    end
  end
end
