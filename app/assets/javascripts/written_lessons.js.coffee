jQuery ->
	$('#new_written_lesson, .edit_written_lesson').on("click", ".add_fields", (evt) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		evt.preventDefault()
	)
