$(function() {
  $('i img').on('mouseover', function() {
    var imgSrc = $(this).data('hover-src');

    $(this).attr('src', imgSrc)
  });

  $('i img').on('mouseout', function() {
    var imgSrc = $(this).data('orig-src');

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
    wrap: 'circular',
    animation: { duration: 1500 }
  });

  $('.jcarousel-pagination').on('jcarouselpagination:active', 'a', function() {
    $(this).addClass('active');
  })
  .on('jcarouselpagination:inactive', 'a', function() {
    $(this).removeClass('active');
  }).jcarouselPagination({
      item: function(page) {
          return '<a href="#' + page + '">' + page + '</a>';
      }
  });

  $('.jcarousel').jcarouselAutoscroll({
    interval: 7500
  });

  $('.jcarousel-control').jcarouselControl({
    event: 'mouseover'
  });

  var altcrement = -1;
  $(window).resize(function(){
      var currentFontSize = parseFloat($('html').css('font-size'));
      $('html').css('font-size', currentFontSize + (altcrement *= -1) + 'px');
  });

});