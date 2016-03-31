class News < ActiveRecord::Base
	mount_uploaders :attachments, NewsAttachmentUploader

	validates :title, presence: true
	validates :content, presence: true

	after_create :vk_wall_post
	after_update :vk_wall_edit
	after_destroy :vk_wall_delete

	private

		def vk_wall_post
			vk = vk_init
			vk_response = vk.wall.post owner_id: ENV['vk_owner_id'], from_group: 1, signed: 0, message: ActionView::Base.full_sanitizer.sanitize(self.content), attachments: get_attachments(self.attachments)
			self.update_column(:vk_post_id, vk_response.post_id)
		end

		def vk_wall_edit
			vk = vk_init
			vk.wall.edit owner_id: ENV['vk_owner_id'], from_group: 1, signed: 0, message: ActionView::Base.full_sanitizer.sanitize(self.content), post_id: self.vk_post_id, attachments: get_attachments(self.attachments)
		end

		def vk_wall_delete
			vk = vk_init
			vk.wall.delete owner_id: ENV['vk_owner_id'], post_id: self.vk_post_id
		end
end
