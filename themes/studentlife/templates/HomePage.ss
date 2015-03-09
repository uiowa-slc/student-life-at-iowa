<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js demo-1"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home | Student Life at Iowa | The University of Iowa</title>
<% base_tag %>
<% include OpenGraph %>
<% include Ascii %>

<!-- Critical CSS -->
<style><% include CriticalCss %></style>
<!-- CSS -->
<script>
			/*!
			loadCSS: load a CSS file asynchronously.
			[c]2014 @scottjehl, Filament Group, Inc.
			Licensed MIT
			*/
			function loadCSS( href, before, media, callback ){
				"use strict";
				// Arguments explained:
				// `href` is the URL for your CSS file.
				// `before` optionally defines the element we'll use as a reference for injecting our <link>
				// By default, `before` uses the first <script> element in the page.
				// However, since the order in which stylesheets are referenced matters, you might need a more specific location in your document.
				// If so, pass a different reference element to the `before` argument and it'll insert before that instead
				// note: `insertBefore` is used instead of `appendChild`, for safety re: http://www.paulirish.com/2011/surefire-dom-element-insertion/
				var ss = window.document.createElement( "link" );
				var ref = before || window.document.getElementsByTagName( "script" )[ 0 ];
				var sheets = window.document.styleSheets;
				ss.rel = "stylesheet";
				ss.href = href;
				// temporarily, set media to something non-matching to ensure it'll fetch without blocking render
				ss.media = "only x";
				ss.onload = callback || function() {};
				// inject link
				ref.parentNode.insertBefore( ss, ref );
				// This function sets the link's media back to `all` so that the stylesheet applies once it loads
				// It is designed to poll until document.styleSheets includes the new sheet.
				function toggleMedia(){
					var defined;
					for( var i = 0; i < sheets.length; i++ ){
						if( sheets[ i ].href && sheets[ i ].href.indexOf( href ) > -1 ){
							defined = true;
						}
					}
					if( defined ){
						ss.media = media || "all";
					}
					else {
						setTimeout( toggleMedia );
					}
				}
				toggleMedia();
				return ss;
			}
			loadCSS( "{$ThemeDir}/css/master.css" );
		</script>
<noscript><link href="{$ThemeDir}/css/master.css" rel="stylesheet"></noscript>

<!-- IE FIXES -->
<!--[if lt IE 9]>
		<script src="{$ThemeDir}/js/ie/html5shiv.js"></script>
		<script src="{$ThemeDir}/js/ie/respond.min.js"></script>
<![endif]-->

<!-- Typekit -->
<% include TypeKit %>

</head>
<body>

<div id="skrollr-body">
	<% include DivisionBar %>
	<% include Header %>


	<section id="collage">
		<div class="collage-top"></div>
		<div class="photos"></div>
		<div class="photos2"></div>
		<div class="photos3"></div>
		<div class="photos4"></div>
		<div class="collage-desc">
			<div class="inner container">
				<h1>Student Life at Iowa</h1>
				<p>The Division of Student Life fosters student success by creating and promoting inclusive educationally purposeful services and activities within and beyond the classroom.</p>
			</div>
		</div>
		<!-- <span class="scrollarrow"></span> -->
	</section>

	<% include MainNav %>

	$Layout

	<% include Footer %>

</div>
	<!-- JS -->
	<script async src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script async src="{$ThemeDir}/js/build/production.min.js"></script>
	<script async src="{$ThemeDir}/js/skrollr.js"></script>
	<script async src="{$ThemeDir}/js/home.js"></script>
	<% include Analytics %>
</body>
</html>
