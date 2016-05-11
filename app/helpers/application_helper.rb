module ApplicationHelper
	def current_class?(path)
    'menu__item_state_active' if request.url.include?(path)
  end
end
