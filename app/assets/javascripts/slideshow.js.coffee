add_slide_pieces = ->
	if $('.slide li').eq(0).is(':hidden')
		$('.slide li').eq(0).delay(500).fadeIn(1000, ->
			$('.slide li').eq(1).delay(500).fadeIn(1000, ->
				$('.slide li').eq(2).delay(500).fadeIn(1000, ->
					$('.slide li').eq(3).delay(500).fadeIn(1000)
				)
			)
		)

jQuery ->
	add_slide_pieces()