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
    if(!$('.signInPage').length) {
      $('.loginOverlay, .loginModal').addClass('active');
    }
  })

  $('.signUp').on('click', function(event) {
    event.preventDefault();
    if(!$('.signUpPage').length) {
      $('.loginOverlay, .registerModal').addClass('active');
    }
  })

  $('.close').on('click', function(event) {
    event.preventDefault();
    $('.loginOverlay').removeClass('active');
    $(this).closest('.formContainer').removeClass('active');
  })

  var jcarousel = $('.jcarousel');

  jcarousel
      .on('jcarousel:reload jcarousel:create', function () {
          var width = $('.carousel').innerWidth();
          jcarousel.jcarousel('items').css('width', width + 'px');
          jcarousel.css('opacity', 1);
      })


  $('.jcarousel').jcarousel({

  });

  $('.jcarousel-control').jcarouselControl({
    event: 'mouseover'
  });

  $('.jcarousel-prev').jcarouselControl({
    target: '-=1'
  });

  $('.jcarousel-next').jcarouselControl({
    target: '+=1'
  });


});