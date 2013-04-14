jQuery ->
	floating_toolbar()

floating_toolbar = ->
	$(window).scroll( ->
		scroll_amount_y = $(this).scrollTop()
		$('header').css('top', scroll_amount_y)
	)