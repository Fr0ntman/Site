$('.js-speciality').append "<%= j render(partial: 'speciality_list', locals: {courses: @courses}) %>"
<% if @courses.next_page %>
$('.pagination').replaceWith "<%= j will_paginate(@courses) %>"
<% else %>
$('.pagination').remove()
$('.js-btn-showmore').remove()
<% end %>