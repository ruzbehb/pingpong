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

	$('.club_location_finder').on('ajax:success', function(e, clubs){
		$('.clubs').html("");
		clubs.forEach(function(club){
			$('.clubs').append($('<p> <a href=\"' + club.lnk + '\">' + club.name + ': </a>' + club.distance + ' miles away</p>' ))
		})
	})
})