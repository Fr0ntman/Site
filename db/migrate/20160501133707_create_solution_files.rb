class CreateSolutionFiles < ActiveRecord::Migration
  def change
    create_table :solution_files do |t|

      t.timestamps null: false
    end
  end
end
