module ApplicationHelper
	def active_class(link_path)
		current_page?(link_path) ? "menu__item_state_active" : ""
	end
end
