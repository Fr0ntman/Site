$(document).on 'page:change', ->

	$('.tab').each ->
		$(this).click (e) ->
			template = $(this).data 'template'
			$('.container.container_mt_40').html Base64.decode template if template