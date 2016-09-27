$('.news .content-col').first().append "<%= j print_news_even(@news).html_safe %>"
$('.news .content-col').last().append "<%= j print_news_odd(@news).html_safe %>"
<% if @news.next_page %>
$('.pagination').replaceWith "<%= j will_paginate(@news) %>"
<% else %>
$('.pagination').remove()
$('.js-btn-showmore').remove()
<% end %>