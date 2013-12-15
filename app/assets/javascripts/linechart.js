window.App = angular.module('App', []);

App.controller('LineChartController', function($scope){

  // $scope.scale = 10;
  
  var playerRecords = [{points: 0, coordinates: [{x:0,y:115}]},
                        {points: 0, coordinates: [{x:0,y:115}]}]

  var addCoordinates = function(recordsElement){
    var length = recordsElement.coordinates.length;
    recordsElement.coordinates.push({x: length*10, y: 115-recordsElement.points*10});
  }

  $scope.addRally = function(winnerIndex){
    playerRecords[winnerIndex].points +=1;
    addCoordinates(playerRecords[0]);
    addCoordinates(playerRecords[1]);
  }

  var linePaths= function(playerIndex){
    return function() {
      var pathParts = [], currentPoint, i;
      
      for (i = 0; i < playerRecords[playerIndex].coordinates.length; i++) {
        currentPoint = playerRecords[playerIndex].coordinates[i];
        pathParts.push(currentPoint.x + "," + currentPoint.y);
      }

      return "M" + pathParts.join(" L");
    }
  };
  
  $scope.points_1 = playerRecords[0].coordinates;
  $scope.points_2 = playerRecords[1].coordinates;
  $scope.linePath1 = linePaths(0);
  $scope.linePath2 = linePaths(1);
  
});

