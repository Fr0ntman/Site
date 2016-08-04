module ApplicationHelper
	def current_class?(path, cls='menu__item_state_active')
    cls if request.url.include?(path)
  end

  def current_url?(path, cls)
    cls if request.path == path
  end

  def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "sort sort__current sort__#{sort_direction}" : "sort"
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
end
