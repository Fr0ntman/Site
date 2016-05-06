class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
    	t.belongs_to :category, index: true
    	t.string     :title, null: false

      t.timestamps null: false
    end
  end
end
