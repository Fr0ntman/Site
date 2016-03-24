class News < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true

	after_create :vk_wall_post

	private

		def vk_wall_post
			vk = vk_init
			@vk_response = vk.wall.post owner_id: ENV['vk_group_id'], from_group: 1, signed: 0, message: ActionView::Base.full_sanitizer.sanitize(self.content)
			self.update_attribute(:vk_post_id, @vk_response.post_id) unless @vk_response.error.present?
		end
end
