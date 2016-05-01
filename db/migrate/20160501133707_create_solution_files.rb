class CreateSolutionFiles < ActiveRecord::Migration
  def change
    create_table :solution_files do |t|
    	t.belongs_to :task_file, index: true
    	t.string     :title, null: false, default: 'Решение'
    	t.integer    :number, null: false
    	t.string     :file, null: false

      t.timestamps null: false
    end
  end
end
