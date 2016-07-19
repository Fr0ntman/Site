class CreateExamFiles < ActiveRecord::Migration
  def change
    create_table :exam_files do |t|
    	t.belongs_to :exam, index: true
      t.string     :ancestry, index: true
      t.string     :title, null: false, default: 'Экзамен'
      t.integer    :number, null: false
      t.string     :file, null: false
      t.integer    :year, null: false
      t.string     :exam_type

      t.timestamps null: false
    end
  end
end
