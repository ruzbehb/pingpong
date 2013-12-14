window.App = angular.module('App', []);

App.controller('LineChartController', function($scope){
  
  $scope.data = [];


  var players = [{points: 0, coordinates: [{x:0,y:115}]},
                 {points: 0, coordinates: [{x:0,y:115}]}]

  var addCoordinates = function(player, i){
    player.coordinates.push({x: (i+1)*10, y: 115-player.points*10});
  }

  var addWinnerI = function(winner,i){
    players[winner].points +=1;
    addCoordinates(players[0], i);
    addCoordinates(players[1], i);
  }
  angular.forEach($scope.data, addWinnerI);

  $scope.addWinner = function(winner){
    $scope.data.push(winner);
    addWinnerI(winner, $scope.data.length-1);
  }
  $scope.scale = 10;
  var linePaths= function(player_index){
    return function() {
      var pathParts = [], currentPoint, i;
      
      for (i = 0; i < players[player_index].coordinates.length; i++) {
        currentPoint = players[player_index].coordinates[i];
        pathParts.push(currentPoint.x + "," + currentPoint.y);
      }

      return "M" + pathParts.join(" L");
    }
  };
  
//   var p2_progress = [];
//   var p2_points=0;
//   p2_progress.push({x:0,y:115});
// for (var j = 0; j < $scope.data.length; j++) {

//   if($scope.data[j].winner == 2) p2_points += 1;
//   var new_point_p2 = {x: (j+1)*10, y: 115-p2_points*10};
//   p2_progress.push(new_point_p2);
// }

  $scope.points_1 = players[0].coordinates;
  $scope.points_2 = players[1].coordinates;
  $scope.linePath1 = linePaths(0);
  $scope.linePath2 = linePaths(1);
  
//     $scope.linePath2 = function(){
//     var pathParts = [], currentPoint, j;
    
//     for (j = 0; j < $scope.points_2.length; j++) {
//       currentPoint = $scope.points_2[j];
//       pathParts.push(currentPoint.x + "," + currentPoint.y);
//     }

//     return "M" + pathParts.join(" L");
//   }; 
});

