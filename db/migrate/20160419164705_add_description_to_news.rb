class AddDescriptionToNews < ActiveRecord::Migration
  def change
    add_column :news, :description, :string
  end
end
