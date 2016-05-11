$(document).on 'page:change', ->

	$('.tab').each ->
		$(this).click (e) ->
			e.preventDefault()
			$(this).addClass 'tab_state_active'
			$(this).siblings().removeClass 'tab_state_active'
			template = $(this).data 'template'
			$('.container.container_mt_40').html Base64.decode template if template
			return false