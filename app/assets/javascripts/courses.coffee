course_fliter = (options={}) ->
	options.selector ?= '#category'
	options.target ?= '#sub_category'
	options.default_text ?= 'Выберите подкатегорию'

	clear_options = (select_options, selector, text) ->
		select_options.empty()
		selector.find('option').not(':first').remove()
		select_options.parent().find('.select__value').text(text).removeAttr('data-value').removeClass 'text_standart'

	$selected = $(options.selector).find ':selected'
	cat_id = $selected.val()
	url = $(options.selector).data 'remote-url'
	$select_options = $ "#{options.target} + .select .select__options"

	if cat_id
		$.ajax
			type: 'POST'
			url: url
			data: {cat_id: cat_id}
			success: (data) ->
				if data.status is 'ok' and data.categories.length
					clear_options $select_options, $(options.target), options.default_text
					for item in data.categories
						text = item.title
						cls = 'select__options__item'
						$select_options.css 'height', 'auto'
						$('<option/>', text: text, value: item.id).appendTo $(options.target)
						$('<li/>', text: text, class: cls, 'data-value': item.id).appendTo $select_options
				else
					clear_options $select_options, $(options.target), options.default_text
					$select_options.css height: $select_options.css 'max-height'
					$('<div/>', text: 'Опции отсутсвуют', class: "text_gray select__empty").appendTo $select_options

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
		do course_fliter

	$('#sub_category').on 'change', ->
		course_fliter
			selector: '#sub_category'
			target: '#speciality'
			default_text: 'Выберите специальность'