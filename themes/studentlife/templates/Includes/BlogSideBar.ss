
<div id="Sidebar" class="">
	<div class="sidebar-item">
		<h3 class="sidebar-title">Latest News</h3>
		<% with $Page(news) %>
			<ul class="unstyled">
			<% loop $AllChildren.Limit(10) %>
				<li class="clearfix sidebar-blog-item $FirstLast">
					<a href="$Link" class="clearfix">
						<img src="$Photo.CroppedImage(160,120).URL" class="sidebar-blog-img">
						<div class="sidebar-blog-content">
							<h4 class="sidebar-blog-title">$Title</h4>
							<p class="sidebar-blog-snippit">$Content.LimitCharacters(100)</p>
						</div>
					</a>
				</li>
			<% end_loop %>
			</ul>
		<% end_with %>
	</div>

	<div class="sidebar-item">
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=270867676312194&version=v2.0";
		fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
		<div class="fb-like-box" data-href="https://www.facebook.com/uistudentlife" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
	</div>

	<!-- <div>
		<h3 class="">Latest Tweets</h3>
		<a class="twitter-timeline" href="https://twitter.com/imubuddy/lists/division-of-student-life" data-widget-id="365466267437633536" data-chrome="noborders transparent" data-theme="light" height="500" width="100%">Tweets from https://twitter.com/imubuddy/lists/division-of-student-life</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div> -->

	<!-- <div>
		<h3 class="">Latest Events</h3>
		<% loop RSSDisplay(3,"http://afterclass.uiowa.edu/events/feed/rss/") %>
			<li class="justify-item">
			<img src="$Smallimage" alt="$Title">
				<p class="event-date">$Dates</p>
				<h2 class="event-title"><a href="$Link">$Title</a></h2>
				<div class="event-desc">
					$Description.Summary(30)
				</div>
			</li>
			<% end_loop %>
	</div> -->
</div>
