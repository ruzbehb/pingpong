$ ->

	id = $('.match').data('id')

	$("#p1-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 1,
      decrement: true
    },
    success: (data,status) ->
    	$("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p1-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 1
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
    type: 'PATCH'