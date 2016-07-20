class CreateTaskFiles < ActiveRecord::Migration
  def change
    create_table :task_files do |t|
    	t.belongs_to :task, index: true
    	t.string     :ancestry, index: true
    	t.string     :title, null: false
    	t.integer    :number, null: false
    	t.string     :file, null: false
    	t.string     :task_type

      t.timestamps null: false
    end
  end
end
