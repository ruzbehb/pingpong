$ ->

	id = $('.match').data('id')

	$("#p1-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 31,
      decrement: true
    },
    success: (data,status) ->
    	$("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p1-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 31
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p2-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 32,
      decrement: true
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
    type: 'PATCH'

  $("#p2-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 32
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
    type: 'PATCH'