$(document).ready ->
	$('.section').each ->	

		$(this).on 'mousedown', (e) ->
			do e.preventDefault
			return false
			
		$(this).click (e) ->
			$(this).find('.section__options').css('display', 'block').animate height: 'auto', 500