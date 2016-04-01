$ ->
	$('#news_content').summernote()

	$(document).ajaxStart -> $('.spin').spin()
	$(document).ajaxStop -> $('.spin').spin false