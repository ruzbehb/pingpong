$ ->

	id = $('.match').data('id')

	$("#p1-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 12,
      decrement: true
    },
    success: (data,status) ->
    	$("#p1-points").text(data.p1points)
    type: 'PATCH'