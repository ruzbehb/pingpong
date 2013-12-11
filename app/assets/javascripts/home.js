$(function() {
  $('i img').on('mouseover', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '_hover.svg';

    $(this).attr('src', imgSrc)
  });

  $('i img').on('mouseout', function() {
    var imgSrc = '/assets/' + $(this).data('name') + '.svg';

    $(this).attr('src', imgSrc)
  });

  // $('.signIn').on('click', function(event) {
  //   event.preventDefault();
  //   $('.loginModal').show();
  // })

});



// $(function() {

//   $(".fancybox").fancybox();

//   $("a.register").fancybox({
//     // 'width' : 404,
//     // 'height': 400,
//     'autoScale' : false,
//     'transitionIn' : 'none',
//     'transitionOut' : 'none',
//     'type' : 'iframe',
//     'scrolling' : 'no'
//   });

//   $("a.signIn").fancybox({
//     // 'width' : 404,
//     // 'height': 400,
//     'autoScale' : false,
//     'transitionIn' : 'none',
//     'transitionOut' : 'none',
//     'type' : 'iframe',
//     'scrolling' : 'no'
//   });

// });