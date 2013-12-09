$(function() {
  $('i img').on('mouseover', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '_hover.svg';

    $(this).attr('src', imgSrc)
  });

  $('i img').on('mouseout', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '.svg';

    $(this).attr('src', imgSrc)
  });
});