class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
    	t.belongs_to :sub_category, index: true
    	t.string     :title, null: false

      t.timestamps null: false
    end
  end
end
