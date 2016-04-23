if <%= @count %> is 1
  $('.news').fadeOut 500, ->
    $(document.body).append '<p class="news-empty">Нет новостей</p>'
    $(this).remove()
else
  $('#news-<%= @news.id %>').fadeOut 500, -> $(this).remove()

