jQuery ->
	$('#new_video_lesson, .edit_video_lesson').on("click", ".add_fields", (evt) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		evt.preventDefault()
	)