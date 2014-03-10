$(window).load(function() {
	// add js class to body if javascript enabled
	$('html').removeClass('no-js');


	// /* FitVids */
	// $(".media").fitVids();

  // Lazyload
  // $("img.lazy").show().lazyload({
  //   effect : "fadeIn"
  // });


  // Masonry
  var $container = $('#container');
  // initialize
  $container.masonry({
    itemSelector: '.item'
  });

  // Waypoints
  //$('.navbar').waypoint('sticky');
  // $('.upcoming-events').waypoint('sticky', {offset: 60});
  //$('.get-involved-img').waypoint('sticky', {offset: 60});
  // $('.latest-news').waypoint('sticky', {offset: 60});
  // $('.student-success-img').waypoint('sticky', {offset: 60});
  // $('.culture-entertainment-img').waypoint('sticky', {offset: 60});
  // $('.recreation-wellness-img').waypoint('sticky', {offset: 60});
  // $('.health-safety-img').waypoint('sticky', {offset: 60});
  // $('.navbar').waypoint(function(direction) {
  //   $('.navbar').toggleClass('fixed-top');
  // });



});
