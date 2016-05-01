class CreateAnswerFiles < ActiveRecord::Migration
  def change
    create_table :answer_files do |t|
    	t.belongs_to :exam_file, index: true
    	t.string     :title, null: false, default: 'Ответы'
    	t.integer    :number, null: false
    	t.string     :file, null: false

      t.timestamps null: false
    end
  end
end
