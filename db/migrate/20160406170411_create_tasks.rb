class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.belongs_to :course, index: true
    	t.string     :title, null: false
    	t.integer    :number, null: false
    	t.json       :tasks, null: false
    	t.json       :solutions
      t.timestamps null: false
    end
  end
end
