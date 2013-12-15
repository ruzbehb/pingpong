window.App = angular.module('App', []);

App.controller('LineChartController', function($scope){
  
  $scope.data = [];

  var playerRecords = [{points: 0, coordinates: [{x:0,y:115}]},
                        {points: 0, coordinates: [{x:0,y:115}]}]

  var addCoordinates = function(playerIndex, nthRally){
    playerIndex.coordinates.push({x: (nthRally+1)*10, y: 115-playerIndex.points*10});
  }

  var addRally = function(winnerIndex,nthRally){
    playerRecords[winnerIndex].points +=1;
    addCoordinates(playerRecords[0], nthRally);
    addCoordinates(playerRecords[1], nthRally);
  }

  // angular.forEach($scope.data, addRally);

  $scope.addWinner = function(winnerIndex){
    $scope.data.push(winnerIndex);
    addRally(winnerIndex, $scope.data.length-1);
  }

  // $scope.scale = 10;

  var linePaths= function(player_index){
    return function() {
      var pathParts = [], currentPoint, i;
      
      for (i = 0; i < playerRecords[player_index].coordinates.length; i++) {
        currentPoint = playerRecords[player_index].coordinates[i];
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

  $scope.points_1 = playerRecords[0].coordinates;
  $scope.points_2 = playerRecords[1].coordinates;
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

