class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :lecture, index: true, foreign_key: true
      t.string :title, null: false
      t.string :file, null: false
      t.string :material_type, null: false
      t.timestamps null: false
    end
  end
end
