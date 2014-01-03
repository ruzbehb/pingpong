$('.imageGallery a').on('click', function(event) {
  event.preventDefault();
	$('.imageOverlay').addClass('active');
	var $image = $('<img>', { src: $(this).attr('href') });
	$('.imageOverlay').append($image);
});

$('.imageOverlay').click(function() {
	$(this).removeClass('active');
	$(this).find('img').remove();
})