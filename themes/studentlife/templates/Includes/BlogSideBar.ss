
<div class="sidebar">
	<div class="sidebar-item">
		<h3 class="sidebar-title">Student News</h3>
		<% with $Page(news) %>
			<ul class="unstyled">
			<% loop $BlogPosts.Limit(10) %>
				<li class="clearfix sidebar-blog-item $FirstLast">
					<a href="$Link" class="clearfix">
						<% if $ListingPhoto %>
							<img src="{$ThemeDir}/images/placeholder-small.jpg" data-original="$ListingPhoto.CroppedImage(130,105).URL" class="unveil sidebar-blog-img" alt="$Title">
						<% else_if $FeaturedImage %>
							<img src="{$ThemeDir}/images/placeholder-small.jpg" data-original="$FeaturedImage.CroppedImage(130,105).URL" class="unveil sidebar-blog-img" alt="$Title">
						<% end_if %>
					
						<div class="sidebar-blog-content">
							<h4 class="sidebar-blog-title">$Title</h4>
							<% if $Summary %>
							<div class="sidebar-blog-snippit">$Summary.Summary(15)</div>
							<% else %>
							<p class="sidebar-blog-snippit">$Excerpt(15)</p>
							<% end_if %>
							
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

	<%--<div>
		<h3>Latest Events</h3>
		<% with $LocalistCalendar %>
			<% loop $EventList.Limit(5) %>
				<li class="justify-item">
				<img src="$Image.URL" alt="$Title">
					<p class="event-date">
						<% with $Dates.First %>
							<time itemprop="startDate" datetime="$Format(c)">
								$Format(l), $Format(F) $Format(j) at $Format("g:i A") 
							</time>
						<% end_with %>
					</p>
					<h2 class="event-title"><a href="$AfterClassLink">$Title</a></h2>
					<div class="event-desc">
						$Content.Summary(30)
					</div>
				</li>&nbsp;
			<% end_loop %>
		<% end_with %>
	</div> --%>
</div>
