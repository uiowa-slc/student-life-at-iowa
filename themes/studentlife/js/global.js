$(document).ready(function() {
	// add js class to body if javascript enabled
	$('html').removeClass('no-js');


	/* Flexslider
	================================================== */
	$('.flexslider').flexslider({
		slideshow: true,
		pauseOnHover: true
	});

	/* Navigation
	================================================== */
	$('.nav-title a').click(function() {
		$('.nav-main-wrapper').toggleClass('expand');
		return false;
	})

	/* Youtube Video Feed
	================================================== */
	function show_my_videos(data){
		html = ['<div class="container"><div class="row">'];
		$(data.feed.entry).each(function(entry){
			url = this.link[0].href;
			url_thumbnail = this.media$group.media$thumbnail[0].url;
			title = this.media$group.media$title.$t;
			html.push('<div class="col-xs-6 col-md-3"><a href="'+url+'" class="video-link fancybox-media">');
			html.push('<img src="'+url_thumbnail+'" alt="'+title+'"><div class="play"></div>');
			html.push('</a><p>'+title+'</p></div>');
		});
		html.push('</div></div>');
		$(".video-list").html(html.join(''));
	}
	$.ajax({
		type: "GET",
		url: "http://gdata.youtube.com/feeds/users/imubuddy/uploads?alt=json-in-script&format=5&max-results=4",
		cache: false,
		dataType:'jsonp',
		success: function(data){
			show_my_videos(data);

	  }
	});

	/* FancyBox
	================================================== */
	$('.fancybox-media')
		.attr('rel', 'media-gallery')
		.fancybox({
			openEffect : 'none',
			closeEffect : 'none',
			prevEffect : 'none',
			nextEffect : 'none',

			arrows : false,
			helpers : {
				media : {},
				buttons : {}
			}
		});


	/* Slick.js
	================================================= */
	$('.responsive').slick({
		infinite: false,
		speed: 300,
		slidesToShow: 4,
		slidesToScroll: 1,
		responsive: [
		 {
			breakpoint: 980,
			settings: {
				infinite: false,
				slidesToShow: 3,
				slidesToScroll: 1,
				arrows: false,
				dots: true
			}
		 },
		 {
			breakpoint: 750,
			settings: {
				infinite: false,
				slidesToShow: 2,
				slidesToScroll: 2,
				arrows: false,
				dots: true
			}
		 },
		 {
			breakpoint: 479,
			settings: {
				infinite: false,
				slidesToShow: 1,
				slidesToScroll: 1,
				arrows: false,
				dots: true
			}
		 }
	  ]
	});

	/* Unveil image lazy loading */
	$(".unveil").unveil();

	/* FitVids */
	$(".blog-content").fitVids();

});
