class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :lecture, index: true
      t.string     :title, default: 'Задание'
      t.integer    :number, null: false
      
      t.timestamps null: false
    end
  end
end
