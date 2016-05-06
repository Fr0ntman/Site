module ApplicationHelper
	def active_class(controller)
		controller.include?(params[:controller]) ? "menu__item_state_active" : ""
	end
end
