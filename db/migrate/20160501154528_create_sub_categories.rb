class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
    	t.string :title, null: false
    	
      t.timestamps null: false
    end
  end
end
