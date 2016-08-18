$(document).on 'turbolinks:load', ->

	$('.team-tab').each ->
		$(this).click (e) ->
			e.preventDefault()
			$(this).addClass 'tab_state_active'
			$(this).siblings().removeClass 'tab_state_active'
			template = $(this).data 'template'
			$('.container.container_mt_40').html Base64.decode template if template
			return false

	$el = $('.order')
	if $el.length
		top = $el.offset().top
		marginTop = $el.css 'marginTop'
		$(window).scroll( ->
			height = $el.height()
			winHeight = $(window).height()
			gap = 50
			scrollTop = $(this).scrollTop()
			if scrollTop >= top
				$el.stop().animate {"marginTop": scrollTop - top + gap}, 'swing'

				$('.collabs__header').each (i) ->
					if $(this).offset().top - 20 <= scrollTop
						$('.order a').removeClass 'order__item__active'
						$('.order .order__item').eq(i).find('a').addClass 'order__item__active'
			else
				$el.stop().animate {'marginTop', marginTop}, 'swing'

				$('.order .order__item__active').removeClass 'active'
				$('.order .order__item:first').find('a').addClass 'active'

		).scroll()

		$('.order a').on 'click', (e) -> 
			do e.preventDefault
			$target = $ $(this).attr 'href'
			$('html, body').stop().animate 'scrollTop': $target.offset().top - 20