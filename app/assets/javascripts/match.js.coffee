

$ ->

	id = $('.match').data('id')

	$("#p1-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 60,
      decrement: true
    },
    success: (data,status) ->
    	$("#p1-points").text(data.p1points)
    type: 'PATCH'

  $("#p1-increment").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      player_id: 60,
      decrement: false
    },
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
    type: 'PATCH'


  scoreAlert = ->


  connection = new WebSocketRails('localhost:3000/websocket')
  channel = connection.subscribe('table')

  channel.bind 'edit', (match) ->
    scoreAlert();
    console.log match.p1g1
    console.log match.p2g1
    $('.p1g1').text(match['p1g1'])



