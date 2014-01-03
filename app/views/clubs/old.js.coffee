 / content_for :scripts do 
	/ :javascript
	/ 	$(document).ready(function(){
	/ 		$("#map").css("height", $('body').height());
	/ 		$("#map").css("width", $('body').width() / 2);

	/ 		handler = Gmaps.build('Google', { builders: { Marker: RichMarkerBuilder } });
	/ 		handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
	/ 			markers = handler.addMarkers(#{raw @club_locations.to_json});
	/ 			handler.bounds.extendWith(markers);
	/ 			handler.fitMapToBounds();
	/ 			});
	/ 	})