$ ->

	link = 'a[data-remote]'
	news_container = '.news'

	$(link).on 'ajax:success', (e, data, status, xhr) ->
		e.preventDefault()
		if <%= @count %> is 1
			$(news_container).fadeOut 500, -> 
				$(document.body).append '<p>Нет новостей</p>'
				$(this).remove()
		else
			$('#news-<%= @news.id %>').fadeOut 500, -> $(this).remove()

	$(link).on 'ajax:error', (e, status, xhr, error) ->
		e.preventDefault()
		alert 'error'
