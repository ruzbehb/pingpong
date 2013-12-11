$ ->

	id = $('.match').data('id')

	# $("#p1-back").click ->
 #    $.patch "/api/matches/#{id}",
 #    {
 #      player_id: 12,
 #      decrement: true
 #    },
 #    (data,status) ->
 #      alert("P1points: " + data.p1points + "\nStatus: " + status)


	$("#p1-back").click ->
    $.post "/api/matches",
    {
      player_id: 12,
      decrement: true
    },
    (data,status) ->
      alert("P1points: " + data.p1points + "\nStatus: " + status)
