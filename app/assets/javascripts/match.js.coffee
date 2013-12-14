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
      # $("#p1-games").text(data.p1games)
    type: 'PUT'

  $("#p1-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p1_id
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)
    type: 'PUT'

  $("#p2-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p2_id,
      decrement: true
    },
    success: (data,status) ->
      $("#p2-points").text(data.p2points)
      # $("#p2-games").text(data.p2games)
    type: 'PUT'

  $("#p2-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: p2_id
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)
    type: 'PUT'


  scoreAlert = ->


  connection = new WebSocketRails('localhost:3000/websocket')
  channel = connection.subscribe('table')

  channel.bind 'edit', (match) ->
    scoreAlert();
   
    $('.p1g1').text(match['p1g1'])
    $('.p2g1').text(match['p2g1'])
    $('.p1g2').text(match['p1g2'])
    $('.p2g2').text(match['p2g2'])
    $('.p1g3').text(match['p1g3'])
    $('.p2g3').text(match['p2g3'])


    

