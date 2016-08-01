$(document).on 'turbolinks:load', ->

	$('select.selector').each ->

		$selector = $(this)
		selector_cls = $selector.attr('class').split(' ')
		selector_cls.shift()
		selector_cls.join ' '
		$selector.css display: 'none'	
		$selector_options = $selector.find('option')
		
		select_value_cls = ['select__value']
		if $selector_options.eq(0).attr('value') isnt ''
			default_value = $selector_options.filter((index) -> $(this).prop 'selected').text()
			select_value_cls.push 'text_standart'
		else
			default_value = $selector_options.eq(0).text()

		$select = $('<div/>', class: "select #{selector_cls}").insertAfter $selector
		$select_value = $('<div/>', text: default_value, class: select_value_cls.join ' ').appendTo $select
		$select_options = $('<ul/>', class: 'select__options').appendTo $select

		$selector_options.each ->
			if $(this).attr 'value'
				text  = $(this).text()
				cls = ['select__options__item']
				if $(this).prop 'selected' then cls.push 'select__options__selected'
				$options_item = $('<li/>', text: text, class: cls.join(' '), 'data-value': $(this).attr('value')).appendTo $select_options

		$select_options.mCustomScrollbar
			axis: "y"
			theme: "minimal-dark"
			scrollInertia: 300

		$select_value.on 'mousedown', (e) ->
			do e.preventDefault
			return false

		$select_options.on 'mousedown', (e) ->
			do e.preventDefault
			do e.stopPropagation
			
		$select_value.click (e) ->
			do e.stopPropagation

			if $(this).hasClass 'opened'
				$(this).removeClass 'opened'
				if $selector.hasClass 'select-field' then $select.css 'borderBottomLeftRadius': '3px', 'borderBottomRightRadius': '3px'
				$select_options.slideUp()
			else
				$select.siblings().find('.select__value').removeClass 'opened'
				$select.siblings().find('.select__options').slideUp()
				$(this).addClass 'opened'
				if $selector.hasClass 'select-field' then $select.css 'borderBottomLeftRadius': '0', 'borderBottomRightRadius': '0'
				$select_options.slideDown()

		$(document).on 'mousedown', (e) =>
			if $select_options.is ':visible'
				$select_value.removeClass 'opened'
				if $selector.hasClass 'select-field' then $select.css 'borderBottomLeftRadius': '3px', 'borderBottomRightRadius': '3px'
				$select_options.slideUp()

		$select.find('.select__options__item').each ->

			if $(this).hasClass 'select__options__selected'
				text = $(this).text()
				font_color_cls = 'text_standart'
				$select_value.addClass font_color_cls unless $select_value.hasClass font_color_cls
				$select_value.text text

			$(this).click (e) ->
				unless $(this).hasClass 'select__options__selected'
					$(this).addClass 'select__options__selected'
					$(this).siblings().removeClass 'select__options__selected'
				$item = $(this)
				$selector.find("[value=\"#{$(this).data('value')}\"]").prop 'selected', 'selected'
				text = $(this).text()
				font_color_cls = 'text_standart'
				$select_value.text text
				$select_value.addClass font_color_cls unless $select_value.hasClass font_color_cls
				$select_value.removeClass 'opened'
				if $selector.hasClass 'select-field' then $select.css 'borderBottomLeftRadius': '3px', 'borderBottomRightRadius': '3px'
				$select_options.slideUp()