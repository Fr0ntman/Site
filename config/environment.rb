# Load the Rails application.
require File.expand_path('../application', __FILE__)

def vk_init
	VK::Client.new ENV['vk_access_token']
end
# Initialize the Rails application.
Rails.application.initialize!
