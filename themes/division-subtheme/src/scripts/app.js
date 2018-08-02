
// homepage what we do carousel
$('.infosection').flickity({
	cellAlign: 'center',
	contain: true,
	imagesLoaded: true,
	pageDots: false,
	initialIndex: 2,
	wrapAround: true,
	freeScroll: true
});

// homepage deptment slider
$('.dept-slider__gallery').flickity({
	imagesLoaded: true,
	pageDots: false,
	wrapAround: true,
	contain: true,
	lazyLoad: true,
	arrowShape: {
		x0: 10,
		x1: 60, y1: 50,
		x2: 65, y2: 45,
		x3: 20
	}
});


$('.cardflip-btn').on('click', function () {
  $('.card').toggleClass('flipped');
});


// Year In Review - Shop/hide text
$(".toggletext").on("click", function () {
	var txt = $(".slidetext").is(':visible') ? 'Read More' : 'Read Less';
	$(".toggletext").text(txt);
	$('.slidetext').slideToggle('slow');
});



// Year In Review - Isotope article filters
var $container = $('.yir-article-container'),
	$checkboxes = $('#filters input');

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


$checkboxes.change(function(){
	var filters = [];
	// get checked checkboxes values
	$checkboxes.filter(':checked').each(function(){
	filters.push( this.value );
	});
	filters = filters.join(', ');
	$container.isotope({ filter: filters });
});

var $items = $container.children();






// Fade technique https://codepen.io/davatron5000/pen/oENPYq
// Set the variable to the scroll distance
window.addEventListener('scroll', function() {
	document.body.style.setProperty("--scroll-amount", (document.body.scrollTop || document.documentElement.scrollTop) );
});

const title = document.querySelector('h1.title');
const speed = 0.02;
title.style.transform = 'translateY( calc( var(--scrollparallax) * 1px ) )';

function setScrollParallax() {
	title.style.setProperty("--scrollparallax", (document.body.scrollTop || document.documentElement.scrollTop) * speed);
	window.requestAnimationFrame( setScrollParallax );
}

window.requestAnimationFrame( setScrollParallax );


// Position sticky pollyfill (https://github.com/wilddeer/stickyfill)
var elements = document.querySelectorAll('.sticky');
Stickyfill.add(elements);




//Code stolen from css-tricks for smooth scrolling:
$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
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

