$ ->

  id = $('.match').data('id')

  p1_id = $('#p1-name').data('id')
  p2_id = $('#p2-name').data('id')

  isOddNumberedGame = (match) ->
    (match.p1games + match.p2games) % 2 != 0

  flipBoard = (match) ->
    $('.match').toggleClass('flipped', isOddNumberedGame(match))

  indicateServer = (match) ->
    $('#p1marker').toggle(match.currently_serving == 0)
    $('#p2marker').toggle(match.currently_serving == 1)
    console.log("server: #{match.currently_serving}")

  $("#p1-points, #p2-points").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data:
      player_id: $(this).closest('section').find('h2').data('id'),
      decrement: $(this).data('decrement')
    ,
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)

      flipBoard(data)
      indicateServer(data)
      if(data.gameover)
        $('.game_over').show()
    ,type: 'PUT'


  $("#p1-back, #p2-back").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data:
      player_id: $(this).closest('section').find('h2').data('id'),
      decrement: $(this).data('decrement')
    ,
    success: (data,status) ->
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)

      flipBoard(data)
      indicateServer(data)
      $('.game_over').hide()
    ,type: 'PUT'

  $(".game_button").on 'click', (e) ->
    e.preventDefault()
    $.ajax "/api/matches/#{id}",
    data: {
      new_game: true
    }
    success: (data,status) ->
      $('.game_over').hide()
      $("#p1-points").text(data.p1points)
      $("#p1-games").text(data.p1games)
      $("#p2-points").text(data.p2points)
      $("#p2-games").text(data.p2games)
      if(data.matchover)
        $('.match_over').show()
      flipBoard(data)
      indicateServer(data)
    type: 'PUT'

  $(".tableContainer").on 'click', (e) ->
    window.location=$(this).find("a").attr("href") 
    return false

  connection = new WebSocketRails(window.location.host + '/websocket')
  channel = connection.subscribe("table#{id}")

  channel.bind 'edit', (match) ->
    $('.p1g1').text(match['p1g1'])
    $('.p2g1').text(match['p2g1'])
    $('.p1g2').text(match['p1g2'])
    $('.p2g2').text(match['p2g2'])
    $('.p1g3').text(match['p1g3'])
    $('.p2g3').text(match['p2g3'])
    $('.g1winner').text(match['g1winner'])
    $('.g2winner').text(match['g2winner'])
    $('.g3winner').text(match['g3winner'])
    $('.score1').text(match['p1current_points']) 
    $('.score2').text(match['p2current_points']) 

    appElement = document.querySelector('[ng-controller=ChartController]')

    if(appElement)
      $scope = angular.element(appElement).scope()
      $scope.$apply ->
        if(Boolean(match.new_game))
          $scope.clearPlayerProgressRecords()
          $scope.clearRallyWinner()
          if(match['g2winner'])
            $scope.setServer(0)
          else if(match['g1winner'])
            $scope.setServer(1)
          else 
            $scope.setServer(0)
        else
          $scope.updateRally(match['rally_winner_index'], Boolean(match.decrement))


