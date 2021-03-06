# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vk_post_id  :integer
#  attachments :json
#  description :string
#

class News < ActiveRecord::Base
  mount_uploaders :attachments, NewsAttachmentUploader

  belongs_to :category, class_name: 'NewsCategory'

  validates :title, presence: true , length: { maximum: 125 }
  validates :content, presence: true
  validates :category_id, presence: true
  validates :description, length: { maximum: 190 }

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  # after_create :vk_wall_post
  # after_update :vk_wall_edit
  # after_destroy :vk_wall_delete
  after_destroy :delete_attachments

  self.per_page = 20

  private

    def vk_wall_post
      vk_response = VK_CLIENT.wall.post owner_id: ENV['vk_owner_id'],
                                        from_group: 1, signed: 0,
                                        message: ActionView::Base.full_sanitizer.sanitize(content),
                                        attachments: get_attachments
      update_column(:vk_post_id, vk_response.post_id)
    end

    def vk_wall_edit
      VK_CLIENT.wall.edit owner_id: ENV['vk_owner_id'],
                          from_group: 1, signed: 0,
                          message: ActionView::Base.full_sanitizer.sanitize(content),
                          post_id: vk_post_id,
                          attachments: get_attachments
    end

    def vk_wall_delete
      VK_CLIENT.wall.delete owner_id: ENV['vk_owner_id'],
                            post_id: vk_post_id
    end

    def get_attachments
      upload_url = VK_CLIENT.photos.get_wall_upload_server(group_id: ENV['vk_group_id']).upload_url
      files = []
      self.attachments.each do |file|
        mime_type = MIME::Types.type_for(file.current_path).first.content_type
        vk_response = VK.upload url: upload_url, file: [file.current_path, mime_type]
        vk_response.group_id = ENV['vk_group_id']
        result = VK_CLIENT.photos.save_wall_photo vk_response
        result.each do |item|
          files << item.id
        end
      end
      files
    end

    def delete_attachments
      self.remove_attachments!
    end
end
