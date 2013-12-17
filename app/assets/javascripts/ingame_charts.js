window.App = angular.module('App', []);

App.controller('ChartController', function($scope){

  var playerRecords = [{points: 0, coordinates: [{x:25,y:300}]},
                        {points: 0, coordinates: [{x:25,y:300}]}]

  var addCoordinates = function(recordsElement){
    var length = recordsElement.coordinates.length;
    recordsElement.coordinates.push({x: 25+(length*25), y: 300-recordsElement.points*25});
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


  $scope.addRally = function(winnerIndex){
    playerRecords[winnerIndex].points +=1;
    addCoordinates(playerRecords[0]);
    addCoordinates(playerRecords[1]);
    rallyWinner.push(winnerIndex);
    var serverIndex = serverLookup(rallyWinner.length);
    serveStatsAllocate(serverIndex, winnerIndex);
    $scope.pieOptions.data = [serveStats[0].servePointsAgainst, serveStats[0].servePointsFor];
    $scope.p1ServePercentage = servePointPercentage(0);
  }


  $scope.pieOptions = {
    data: [],
    wedges: [],
    cx: 160,
    cy: 525,
    r: 100,
    colors: ["black", "white"]
  };

  $scope.$watch('pieOptions', function(oldVal, newVal) {
    $scope.piePath();
  }, true);

  // data, width, height, cx, cy, r, colors, labels, lx, ly
  $scope.piePath = function() {
    $scope.pieOptions.wedges = [];

    // Add up the data values so we know how big the pie is
    var total = 0;
    for(var i = 0; i < $scope.pieOptions.data.length; i++) {
      total += +$scope.pieOptions.data[i];
    }

    // Now figure out how big each slice of pie is. Angles in radians.
    var angles = [];
    for(i = 0; i < $scope.pieOptions.data.length; i++)
      angles[i] = $scope.pieOptions.data[i]/total*Math.PI*2;

    // Loop through each slice of pie.
    startangle = 0;
    for(i = 0; i < $scope.pieOptions.data.length; i++) {
      // This is where the wedge ends
      var endangle = startangle + angles[i];

      // Compute the two points where our wedge intersects the circle
      // These formulas are chosen so that an angle of 0 is at 12 o'clock
      // and positive angles increase clockwise.
      var x1 = $scope.pieOptions.cx + $scope.pieOptions.r * Math.sin(startangle);
      var y1 = $scope.pieOptions.cy - $scope.pieOptions.r * Math.cos(startangle);
      var x2 = $scope.pieOptions.cx + $scope.pieOptions.r * Math.sin(endangle);
      var y2 = $scope.pieOptions.cy - $scope.pieOptions.r * Math.cos(endangle);

      // This is a flag for angles larger than than a half circle
      // It is required by the SVG arc drawing component
      var big = 0;
      if (endangle - startangle > Math.PI)
        big = 1;

      // This string holds the path details
      var d = "M " + $scope.pieOptions.cx + "," + $scope.pieOptions.cy + // Start at circle center
        " L " + x1 + "," + y1 + // Draw line to (x1,y1)
        " A " + $scope.pieOptions.r + "," + $scope.pieOptions.r + // Draw an arc of radius r
        " 0 " + big + " 1 " + // Arc details...
        x2 + "," + y2 + // Arc goes to to (x2,y2)
        " Z"; // Close path back to (cx,cy)

      // The next wedge begins where this one ends
      startangle = endangle;

      $scope.pieOptions.wedges.push(d);
    }
  };

  var rallyWinner = [];

  var serveStats = [{servePointsFor: 0, servePointsAgainst: 0},
                    {servePointsFor: 0, servePointsAgainst: 0}];

  var serverLookup = function(nthRally){
   if (Math.round(nthRally/2)% 2 == 1) 
    {
       return 0;
    }
   else {
       return 1;
    }
  };

  var serveStatsAllocate = function(server, winner){
  if (server === winner)
    {
      serveStats[server].servePointsFor +=1;
    }
  else
    {
      serveStats[server].servePointsAgainst +=1;
    }
  };

  var servePointPercentage = function(server) {
    var servePoints = serveStats[server].servePointsFor + serveStats[server].servePointsAgainst;
    return (serveStats[server].servePointsFor/servePoints*100).toFixed(0);
  };
  
});

