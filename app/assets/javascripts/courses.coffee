$(document).on 'turbolinks:load', ->

	# $('.sidebar-tab').each ->
	# 	$(this).click (e) ->
	# 		e.preventDefault()
	# 		$(this).addClass 'tab_state_active'
	# 		$(this).siblings().removeClass 'tab_state_active'
	# 		template = $(this).data 'template'
	# 		$('.container.container_mt_40').html Base64.decode template if template
	# 		return false

	$('#category').on 'change', ->
		$selected = $(this).find ':selected'
		cat_id = $selected.val()
		url = $(this).data 'remote-url'
		$select_options = $('#sub_category + .select .select__options')
		$selector = $('#sub_category')
		if !!cat_id
			$.ajax
				type: 'POST'
				url: url
				data: {cat_id: cat_id}
				success: (data) ->
					if data.status is 'ok' and data.sub_categories.length
						$select_options.empty()
						$selector.find('option').not(':first').remove()
						for item in data.sub_categories
							text = item.title
							cls = 'select__options__item'
							$select_options.css 'height', 'auto'
							$('<option/>', text: text, value: item.id).appendTo $selector
							$('<li/>', text: text, class: cls, 'data-value': item.id).appendTo $select_options
					else
						$selector.find('option').not(':first').remove()
						$select_options.empty()
						$select_options.css height: $select_options.css 'max-height'
						$('<div/>', text: 'Опции отсутсвуют', class: "text_gray select__empty").appendTo $select_options
