$(document).on 'turbolinks:load', ->

	$('[role="show-more"]').click (e) ->
		do e.preventDefault

		url = $('.pagination .next_page').attr 'href'
		$.getScript url if url