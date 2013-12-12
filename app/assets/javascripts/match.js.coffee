

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
      $("#p1-games").text(data.p1games)
    type: 'PATCH'

  $("#p1-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p1_id
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
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
      $("#p2-games").text(data.p2games)
    type: 'PATCH'

  $("#p2-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p2_id
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)
    type: 'PATCH'


  scoreAlert = ->


  connection = new WebSocketRails('localhost:3000/websocket')
  channel = connection.subscribe('table')

  channel.bind 'edit', (match) ->
    scoreAlert();
    console.log match.p1g1
    console.log match.p2g1
    $('.p1g1').text(match['p1g1'])


    

