App.directive('pie',function(){
	return {
		restrict: 'EA',
		replace: true,
		transclude: true,
		scope: { data:'=',colors: '=' },
		template: '<svg xmlns="http://www.w3.org/2000/svg" width="260" height="260" class="pie-chart">'+
		      '<path ng-repeat="d in wedges" class="chart_pie" ng-attr-d="{{d}}" fill="{{colors[$index]}}" />' +
		    '</svg>	',
	  link: function(scope, element, attrs){
  	  var pieOptions = {
		    cx: 104,
		    cy: 104,
		    r: 100
		  };
		  var buildPiePathWedges = function() {
		    scope.wedges = [];

		    // Add up the data values so we know how big the pie is
		    var total = 0;
		    for(var i = 0; i < scope.data.length; i++) {
		      total += +scope.data[i];
		    }

		    // Now figure out how big each slice of pie is. Angles in radians.
		    var angles = [];
		    for(i = 0; i < scope.data.length; i++)
		      angles[i] = scope.data[i]/total*Math.PI*2;

		    // Loop through each slice of pie.
		    startangle = 0;
		    for(i = 0; i < scope.data.length; i++) {
		      // This is where the wedge ends
		      var endangle = startangle + angles[i];

		      // Compute the two points where our wedge intersects the circle
		      // These formulas are chosen so that an angle of 0 is at 12 o'clock
		      // and positive angles increase clockwise.
		      var x1 = pieOptions.cx + pieOptions.r * Math.sin(startangle);
		      var y1 = pieOptions.cy - pieOptions.r * Math.cos(startangle);
		      var x2 = pieOptions.cx + pieOptions.r * Math.sin(endangle);
		      var y2 = pieOptions.cy - pieOptions.r * Math.cos(endangle);

		      // This is a flag for angles larger than than a half circle
		      // It is required by the SVG arc drawing component
		      var big = 0;
		      if (endangle - startangle > Math.PI)
		        big = 1;

		      // This string holds the path details
		      var d = "M " + pieOptions.cx + "," + pieOptions.cy + // Start at circle center
		        " L " + x1 + "," + y1 + // Draw line to (x1,y1)
		        " A " + pieOptions.r + "," + pieOptions.r + // Draw an arc of radius r
		        " 0 " + big + " 1 " + // Arc details...
		        x2 + "," + y2 + // Arc goes to to (x2,y2)
		        " Z"; // Close path back to (cx,cy)

		      // The next wedge begins where this one ends
		      startangle = endangle;

		      scope.wedges.push(d);
		    }
		  };
		  buildPiePathWedges();
		  scope.$watch('data',buildPiePathWedges)
	  }
	};
});
