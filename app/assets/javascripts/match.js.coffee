$ ->

  id = $('.match').data('id')

  p1_id = $('#p1-name').data('id')
  p2_id = $('#p2-name').data('id')

  $("#p1-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p1_id,
      decrement: true
    },
    success: (data,status) ->
    	$("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p1-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p1_id
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p2-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p2_id,
      decrement: true
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
    type: 'PATCH'

  $("#p2-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p2_id
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
    type: 'PATCH'