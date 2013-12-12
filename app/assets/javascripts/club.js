// $.ajax({
// 	type: 'GET'
// 	url: '/clubs/near', 
// 	dataType: 'json',
// 	data: {}
// 	success: function(data) {
// 	$('#content').empty()
// 		$.each(data, function(entryIndex,entry){
// 		var html = '<div class="data">;
// 		html += entry['club'] + ': ' + entry['distance'] + '</div>
// 		$('#content').append(html)
// 		});
// 	}
// });

$(document).ready(function(){

	$('#club_location_finder').on('ajax:success', function(e, clubs){
		clubs.forEach(function(club){
			$('.clubs_near').append($('<div />', {text: (club.club + ': ' + club.distance + ' miles')} ))
		})
	})
})