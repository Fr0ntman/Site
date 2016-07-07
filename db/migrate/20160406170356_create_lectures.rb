class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.belongs_to :course, index: true
      t.string     :title, null: false
      t.string     :type_title, default: 'Лекция'
      t.text       :description, null: false
      t.integer    :number, null: false
      t.string     :multimedia
      t.string     :materials

      t.timestamps null: false
    end
  end
end
