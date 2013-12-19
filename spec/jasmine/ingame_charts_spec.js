
describe('App controller', function() {
  beforeEach(module('App'));
 
  // describe('ChartController', function(){
 
  //   it('should create "colors" arrays with 2 colors', inject(function($controller) {
  //     var scope = {},
  //     ctrl = $controller('ChartController', { $scope: scope });

  // 		expect(scope.colors1.length).toBe(2);
  // 	}));
  // });

	describe('ChartController', function(){
    var scope = {
    	playerRecords: [{points: 2, coordinates: [{x:25,y:300}, {x:50,y:275}, {x:75,y:275}, {x:100,y:250}]},
                        {points: 1, coordinates: [{x:25,y:300}, {x:50,y:300}, {x:75,y:275}, {x:100,y:275}]}]
    };

    beforeEach(inject(function($controller) {
      ctrl = $controller('ChartController', {$scope: scope});
    }));

    it('has two colors', function() {

        expect(scope.colors1.length).toBe(2);
        
    });

    it('can delete all rallies', function(){
    	scope.clearPlayerProgressRecords();
    	expect(scope.playerRecords).toEqual([{points: 0, coordinates: [{x:25,y:300}]},
                        {points: 0, coordinates: [{x:25,y:300}]}]);
    });

    it('will delete most recent won point by relevant winner', function() {
    		
        // rallyWinner = [0,1,0,0,0,1, 0];
        // scope.deletePoint(1);
        // expect(rallyWinner).toEqual([0,1,0,0,1]);

    });

  });

});
  