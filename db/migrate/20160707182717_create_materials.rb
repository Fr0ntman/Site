class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :lecture, index: true, foreign_key: true
      t.string :title
      t.string :file
      t.string :type, null: false
      t.timestamps null: false
    end
  end
end
