class AddAttachmentsToNews < ActiveRecord::Migration
  def change
    add_column :news, :attachments, :json
  end
end
