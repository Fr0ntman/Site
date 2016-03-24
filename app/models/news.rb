class News < ActiveRecord::Base
	attr_accessor :vk_fail

	validates :title, presence: true
	validates :content, presence: true

	around_create :vk_wall_post

	private

		def vk_wall_post
			begin
				vk = vk_init
				vk_response = vk.wall.post owner_id: ENV['vk_group_id'], from_group: 1, signed: 0, message: ActionView::Base.full_sanitizer.sanitize(self.content)
				self.update_attribute(:vk_post_id, vk_response.post_id)
			rescue VkontakteApi::Error => err
				self.vk_fail = err.message
			else
				yield
		 	end
		end
end
