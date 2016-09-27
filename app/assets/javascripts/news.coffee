$(document).on 'turbolinks:load', ->

	$('.js-news-container').hover	->
		$title = $ '.js-news-title', @
		$description = $ '.js-news-descr', @
		$date = $(@).parent().find '.js-news-date'
		if $description.length
			topBound = $date.offset().top + $date.innerHeight() + 40 # 15px вниз от даты
			titleTop = $title.offset().top
		else
			topBound = 10
			titleTop = 20

		$(@).css 'transform', "translateY(-#{titleTop - topBound}px)"
	,->
		$(@).css 'transform', 'translateY(0)'


	$('.social__link_type_round').click (e) ->
		url = $(this).attr 'href'
		window.open url,'sharer','toolbar=0,status=0,width=648,height=395'

		do e.preventDefault
		return false

	$('.card__image_admin_btn').click (e) ->
		$(this).parent().parent().css 'display', 'none'
		$('.file_upload').css 'display', 'block'
		$('#news_remove_attachments').prop 'checked', 'checked'

		do e.preventDefault
		return false

	$('.check-all').click (e) ->
		$checkboxes = $('input[type="checkbox"]')
		$checkboxes.prop 'checked', !$checkboxes.prop 'checked'

		do e.preventDefault
		return false

	$('.publicate_btn').click (e) ->
		url = $(this).attr 'href'
		method = $(this).data 'method'
		news_ids = []

		$('.table-list').find('[type="checkbox"]:checked').each ->
			news_ids.push $(this).val()

		$.ajax
			type: 'POST'
			url: url
			data:
				_method: method
				news_ids: news_ids

		do e.preventDefault
		return false