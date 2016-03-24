class AddVkPostIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :vk_post_id, :integer
  end
end
