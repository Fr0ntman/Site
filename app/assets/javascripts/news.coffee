$ ->
	$('#news_content').summernote()

	$(document).ajaxStart -> $('.spin').spin()
	$(document).ajaxStop -> $('.spin').spin false

	$('#new_news').on 'ajax:success', (e, data, status, xhr) ->
		$('#new_news').clear_form_errors()
		$('#new_news').clear_form_fields()

	$('#new_news').on 'ajax:error', (e, data, status, xhr) ->
		if data.status is 422 
			$('#new_news').render_form_errors 'news', data.responseJSON
		else
			$('#new_news').clear_form_errors()
			alert data.statusText

	$('a[data-remote]').on 'ajax:success', (e, data, status, xhr) ->
	$('a[data-remote]').on 'ajax:error', (e, data, status, xhr) ->
		console.log 'error'