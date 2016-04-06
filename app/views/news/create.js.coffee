form = '#new_news'
news_item = "<%= j render('news_el', item: @news) %>"

create_news_el = (form) ->
	$(news_item).prependTo('.news').hide 1, -> $(this).fadeIn 500

if $('.news').length 
	create_news_el form
else
	$('.news-empty').remove()
	$(document.body).append '<ul class="news"></ul>'
	create_news_el form
