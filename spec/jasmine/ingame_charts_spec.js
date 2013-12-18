
describe('App controller', function() {
  beforeEach(module('App'));
 
  describe('ChartController', function(){
 
    it('should create "colors" arrays with 2 colors', inject(function($controller) {
      var scope = {},
          ctrl = $controller('ChartController', { $scope: scope });
 
      expect(scope.colors1.length).toBe(2);
      expect(scope.colors2.length).toBe(3);
    }));
  });
});
  