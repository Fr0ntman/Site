form = '#new_news'
<% news_partial = if @news.attachments.empty? then 'news_el_without_img' else 'news_el_with_img' %>
news_item = "<%= j render(news_partial, item: @news) %>"

create_news_el = (form) ->
	$(news_item).prependTo('.news').hide 1, -> $(this).fadeIn 500

if $('.news').length 
	create_news_el form
else
	$('.news-empty').remove()
	$(document.body).append '<ul class="news"></ul>'
	create_news_el form
