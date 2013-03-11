jQuery ->
	blog_settings_popup()

blog_settings_popup = ->
	$('.settings_trigger').mouseenter( ->
		$(this).find('.post_settings').stop(true, true).fadeIn(100)
	)

	$('.settings_trigger').mouseleave( ->
		$(this).find('.post_settings').stop(true, true).fadeOut(100)
	)