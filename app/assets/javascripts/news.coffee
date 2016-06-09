$(document).on 'page:change', ->

	$('.js-news-container').hover	->
			$title = $ '.js-news-title', @
			$date = $(@).parent().find '.js-news-date'
			topBound = $date.offset().top + $date.innerHeight() + 15 # 15px вниз от даты
			titleTop = $title.offset().top

			$(@).css 'transform', "translateY(-#{titleTop - topBound}px)"
		,->
			$(@).css 'transform', 'translateY(0)'


	$('.social__link_type_round').click (e) ->
		url = $(this).attr 'href'
		window.open url,'sharer','toolbar=0,status=0,width=648,height=395'

		do e.preventDefault
		return false