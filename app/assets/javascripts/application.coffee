#= require jquery
#= require jquery_ujs
#= require jquery.remotipart
#= require turbolinks
#= require bootstrap
#= require summernote
#= require_tree .
#= require spin
#= require jquery.spin

$.fn.clear_form_errors = ->
	@find('.form-filed').removeClass 'has-error'
	@find('span.help-block').remove()

$.fn.clear_form_fields = ->
	@find(':input, textarea', @)
		.not(':button, :submit, :reset, :hidden')
		.val('')
		.removeAttr('checked')
		.removeAttr('selected')
	$('#news_content').summernote 'code', ''

$.fn.render_form_errors = (model_name, errors) ->
	form = this
	@clear_form_errors()

	$.each errors, (field, messages) ->
		input = form.find('input, select, textarea').filter ->
			name = $(this).attr 'name'
			regex = new RegExp model_name + '\\[' + field + '\\(?'
			if name then name.match regex

		input.closest('.form-field').addClass 'has-error'
		input.parent().append '<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>'
