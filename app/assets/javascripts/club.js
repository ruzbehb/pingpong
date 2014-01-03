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

	$('.club_location_finder').on('ajax:beforeSend', function(e) {
		$(this).find('.spinner').show();
	});

	$('.club_location_finder').on('ajax:success', function(e, clubs){
		$('.clubs').html("");
		$('.searchBoxContainer').html("");
		clubs.forEach(function(club){
			$('.clubs').append($('<i class="clubName strongText"> <a href=\"' + club.lnk + '\">' + club.name + '</a></i>'));
			$('.clubs').append("<br>");
			$('.clubs').append(club.address);
			$('.clubs').append("<br>");
			$('.clubs').append(club.post_code);
			$('.clubs').append($('<em class="strongText"><p align=\"right\">' + club.distance + ' miles away </p></em><hr class=\"minorLine\"><br>' ));
		})
		$('.spinner').hide();
	})
})