module ApplicationHelper
	def current_class?(path)
    return 'menu__item_state_active' if request.path == path
    ''
  end
end
