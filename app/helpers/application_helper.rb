module ApplicationHelper
	def current_class?(path, cls='menu__item_state_active')
    cls if request.url.include?(path)
  end
end
