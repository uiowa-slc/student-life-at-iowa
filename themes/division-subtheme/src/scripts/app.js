


$('.cardflip-btn').on('click', function () {
	$(this).closest('.cardflip').toggleClass('flipped');
});


// Year In Review - Shop/hide text
$(".toggletext").on("click", function () {
	var txt = $(".slidetext").is(':visible') ? 'Read More' : 'Read Less';
	$(".toggletext").text(txt);
	$('.slidetext').slideToggle('slow');
});



// // Year In Review - Isotope article filters
$( function() {
	// init Isotope
	var $container = $('.yir-article-container');
	var $grid = $('.yir-article-container').imagesLoaded( function() {
		$container.isotope({
			itemSelector: '.yir-article',
			percentPosition: true,
			layoutMode: 'fitRows',
			// masonry: {
			// 	columnWidth: '.grid-sizer'
			// }
		});

	});

  // bind filter button click
  $('#filters').on( 'click', 'button', function() {
    var filterValue = $( this ).attr('data-filter');
    $container.isotope({ filter: filterValue });
  });

  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });

});



// Position sticky pollyfill (https://github.com/wilddeer/stickyfill)
var elements = document.querySelectorAll('.sticky');
Stickyfill.add(elements);




//Code stolen from css-tricks for smooth scrolling:
$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});

