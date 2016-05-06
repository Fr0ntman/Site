class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.belongs_to :course, index: true
      t.string     :title, null: false, default: 'Лекция'
      t.text       :description, null: false
      t.integer    :number, null: false
      t.string     :video
      t.string     :audio
      t.string     :materials
      t.string     :slides

      t.timestamps null: false
    end
  end
end
