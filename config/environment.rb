# Load the Rails application.
require File.expand_path('../application', __FILE__)

def vk_init
	VK::Client.new ENV['vk_access_token']
end

def get_attachments(files)
	vk = vk_init
	upload_url = vk.photos.get_wall_upload_server(group_id: ENV['vk_group_id']).upload_url
	attachments = []
	files.each do |file|
		mime_type = MIME::Types.type_for(file.current_path).first.content_type
		type = case mime_type
			when /^image\//; 'photo'
			when /^video\//; 'video'
		end
		vk_response = VK.upload url: upload_url, type => [file.current_path, MIME::Types.type_for(file.current_path).first.content_type]
		vk_response.group_id = ENV['vk_group_id']
		res = vk.photos.save_wall_photo vk_response
		res.each do |item|
			attachments << item.id
		end
	end
	attachments
end
# Initialize the Rails application.
Rails.application.initialize!
