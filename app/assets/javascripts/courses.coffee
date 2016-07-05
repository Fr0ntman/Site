$(document).on 'turbolinks:load', ->

	$('.section').each ->

		$section = $(this)
		$value = $(this).find('.section__value')
		$options = $section.find('.section__options')

		$options.mCustomScrollbar
			axis: "y"
			theme: "minimal-dark"

		$value.on 'mousedown', (e) ->
			do e.preventDefault
			return false

		$options.click (e) ->
			do e.stopPropagation
			
		$value.click (e) ->
			do e.stopPropagation
			if $(this).hasClass 'opened'
				$(this).removeClass 'opened'
				$options.slideUp()
			else
				$(this).addClass 'opened'
				$options.slideDown()

		$(document).click (e) =>
			if $options.is ':visible'
				$value.removeClass 'opened'
				$options.slideUp()

		$(this).find('.option').each ->

			$(this).click (e) ->
				text = $(this).text()
				font_color_cls = 'text_standart'
				$value.text(text)
				$value.removeClass 'opened'
				$value.addClass font_color_cls unless $value.hasClass font_color_cls
				$options.slideUp()
