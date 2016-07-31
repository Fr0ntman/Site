$(document).on 'turbolinks:load', ->

	$('.section').each ->

		$section = $ this
		$value = $(this).find '.section__value'
		$options = $section.find '.section__options'
		$selected = $options.find '.selected'

		$options.mCustomScrollbar
			axis: "y"
			theme: "minimal-dark"
			scrollInertia: 300

		$value.on 'mousedown', (e) ->
			do e.preventDefault
			return false

		$options.on 'mousedown', (e) ->
			do e.preventDefault
			do e.stopPropagation
			
		$value.click (e) ->
			do e.stopPropagation

			if $(this).hasClass 'opened'
				$(this).removeClass 'opened'
				$options.slideUp()
			else
				$section.siblings().find('.section__value').removeClass 'opened'
				$section.siblings().find('.section__options').slideUp()
				$(this).addClass 'opened'
				$options.slideDown()

		$(document).on 'mousedown', (e) =>
			if $options.is ':visible'
				$value.removeClass 'opened'
				$options.slideUp()

		$(this).find('.option').each ->

			if $(this).hasClass 'selected'
				text = $(this).text()
				font_color_cls = 'text_standart'
				$value.addClass font_color_cls unless $value.hasClass font_color_cls
				$value.text text

			$(this).click (e) ->
				unless $(this).hasClass 'selected'
					$(this).addClass 'selected'
					$(this).siblings().removeClass 'selected'
				text = $(this).text()
				font_color_cls = 'text_standart'
				$value.text text
				$value.addClass font_color_cls unless $value.hasClass font_color_cls
				$value.removeClass 'opened'
				$options.slideUp()


	$('.sidebar-tab').each ->
		$(this).click (e) ->
			e.preventDefault()
			$(this).addClass 'tab_state_active'
			$(this).siblings().removeClass 'tab_state_active'
			template = $(this).data 'template'
			$('.container.container_mt_40').html Base64.decode template if template
			return false
