$(function() {
  $('i img').on('mouseover', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '_hover.svg';

    $(this).attr('src', imgSrc)
  });

  $('i img').on('mouseout', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '.svg';

    $(this).attr('src', imgSrc)
  });

  $modal = $('.loginModal, .registerModal');

  $modal.css({'margin-left': -($modal.width() / 2) + 'px'})
  $modal.css({'margin-top': -($modal.height() / 2) + 'px'})

  $('.signIn').on('click', function(event) {
    event.preventDefault();
    $('.loginOverlay, .loginModal').addClass('active');
  })

  $('.signUp').on('click', function(event) {
    event.preventDefault();
    $('.loginOverlay, .registerModal').addClass('active');
  })

  $('.close').on('click', function(event) {
    event.preventDefault();
    $('.loginOverlay').removeClass('active');
    $(this).closest('.formContainer').removeClass('active');
  })


});