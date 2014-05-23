$(window).load(function() {
	// add js class to body if javascript enabled
	$('html').removeClass('no-js');


	// /* FitVids */
	// $(".media").fitVids();

	// Lazyload
	// $("img.lazy").show().lazyload({
	//   effect : "fadeIn"
	// });


	/* Masonry
	================================================== */
	var $container = $('#container');
	// initialize
	$container.masonry({
		itemSelector: '.item'
	});


	/* Latest News Masonry layout
	================================================== */
	var $container = $('.latestnews-masonry');
	// initialize Masonry after all images have loaded
	$container.imagesLoaded( function() {
		$container.masonry({
			itemSelector: '.latestnews-item'
		});
	});

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
			html.push('<div class="col-xs-6 col-md-3"><a href="'+url+'" class="video-link">');
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
			// If you want to see in console...
			// console.log(data);
			// console.log(data.feed.entry);
			// $(data.feed.entry).each(function(){
			// 	console.log(this.link[0].href);
			// 	console.log(this.media$group.media$thumbnail[3].url);
			// 	console.log(this.media$group.media$description.$t);
			// });
	  }
	});

});
