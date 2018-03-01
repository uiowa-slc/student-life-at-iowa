$('.infosection').flickity({
	cellAlign: 'center',
	contain: true,
	imagesLoaded: true,
	pageDots: false,
	initialIndex: 2,
	wrapAround: true,
	freeScroll: true
});


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