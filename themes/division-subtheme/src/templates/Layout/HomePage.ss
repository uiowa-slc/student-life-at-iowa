<section class="home-feature" aria-label="Student Life News and Events">
	<div class="home-feature__header">
		$Header("dark-header","overlay")
	</div>


	<div class="home-feature__media sticky">
		<% if $Video %>
			<div class="fullwidth-video">
				<video playsinline autoplay muted loop autoplay src="$Video.URL" id="vid-bg" class="ani-vid-fadein" style="opacity: 1;" <% if $VideoPoster %>poster="$VideoPoster.FocusFill(1400,900).URL"<% end_if %>></video>
			</div>
		<% end_if %>
		<div class="home-feature__herotext">
			<h1 class="title"><span>One Division. </span>One Mission.<br /><span class="home-feature__texthighlight">Student Success.</span></h1>
		</div>
	</div>

	<div class="home-feature__content-wrap">
		<div class="home-feature__content">
			<% if $Announcement %>
			<div class="home-feature__announcement">
				$Announcement
			</div>
			<% end_if %>
			<div class="home-feature__news">
				<h2 class="home-feature__event-title">Latest News / <a href="{$BaseHref}news/">View All</a></h2>
				<div class="clearfix news-container">
					<div class="news-main">
						<div class="news-main__article">
							<% with $Page(news) %>
								<% loop $FeaturedNews.limit(1) %>
									<a href="$Link" class="news-main__link">
										<% if $FeaturedImage %>
											<img src="$FeaturedImage.FocusFill(450,600).URL" alt="$Title" class="news-main__img">
										<% else %>
											<img src="{$ThemeDir}/dist/images/news-placeholder.jpg" alt="$Title" class="news-main__img">
										<% end_if %>
										<div class="news-main__content">
											<% if $Departments %>
												<span class="news-main__dept">
													<% loop $Departments %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
												</span>
											<% end_if %>
											<h3 class="news-main__title">$Title</h3>
											<% if $Credits %><p class="news-main__author">By <% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %><span class="byline__and"> and </span><% end_if %><span class="byline__author">$FirstName $Surname</span><% end_loop %></p><% end_if %>
										</div>
									</a>
								<% end_loop %>
							<% end_with %>
						</div>
					</div>
					<div class="news-secondary">
						<% with $Page(news) %>
							<ul class="news-secondary__list clearfix">
								<% loop $FeaturedNews.limit(3, 1) %>
									<li class="news-secondary__item clearfix">
										<a href="$Link" class="clearfix news-secondary__link">
											<% if $FeaturedImage %>
												<img src="$FeaturedImage.FocusFill(320,200).URL" alt="$Title" class="news-secondary__img">
											<% end_if %>
											<div class="news-secondary__content <% if $FeaturedImage %>news-secondary__content--img<% end_if %>">
												<% if $Departments %>
													<span class="news-secondary__dept">
														<% loop $Departments %><% if not $First && $Last %>, <% end_if %>$Title<% end_loop %>
													</span>
												<% end_if %>
												<h3 class="news-secondary__title"><span>$Title</span></h3>
												<% if $Credits %><p class="news-secondary__author">By <% loop $Credits %><% if not $First && not $Last %>, <% end_if %><% if not $First && $Last %><span class="byline__and"> and </span><% end_if %><span class="byline__author">$FirstName $Surname</span><% end_loop %></p><% end_if %>
											</div>
										</a>
									</li>
								<% end_loop %>
							</ul>
						<% end_with %>
					</div>
				</div>
			</div>
			<div class="home-feature__events">
				<h3 class="home-feature__event-title">Upcoming Events / <a href="{$BaseHref}events/">View All</a></h3>
				<% with $Page(events) %>
					<% if $EventList %>
						<ul class="home-event-list">
							<% loop $EventList.Limit(3) %>
								<li class="home-event-list__item">
									<a href="$Link" class="home-event-list__link">
										<% if $Dates %>
											<p class="home-event-list__date">
												<% loop $Dates.Limit(1) %>
													<% include DateTimesList %>
												<% end_loop %>
											</p>
										<% end_if %>
										<h4 class="home-event-list__title">$Title</h4>
										<p class="home-event-list__summary">$Content.Summary(30)</p>
										<% if $Venue %>
											<p class="home-event-list__venue">
												$Venue.Title
											</p>
										<% end_if %>
									</a>
								</li>
							<% end_loop %>
						</ul>
					<% end_if %>
				<% end_with %>
			</div>
		</div>
	</div>
</section>


<!-- What We Do -->
<section class="whatwedo" aria-labelledby="whatwedo__id">
	<div class="row">
		<div class="columns large-10 large-offset-1">
			<% if $WhatWeDoTitle %><h2 class="whatwedo__title" id="whatwedo__id">$WhatWeDoTitle</h2><% end_if %>
			<% if $WhatWeDoContent %><div class="whatwedo__text">$WhatWeDoContent</div><% end_if %>
		</div>
	</div>
	<% with page(what-we-do) %>
	<ul class="infosection">
		<% loop children %>
		<li class="infosection__item">
			<a href="$Link" class="infosection__link">
				<% if $BackgroundImage %>
					<img src="$BackgroundImage.FocusFill(360,450).URL" width="180" height="150" class="infosection__img" alt="$Title">
				<% else_if $YoutubeBackgroundEmbed %>
					<img src="http://img.youtube.com/vi/$YoutubeBackgroundEmbed/sddefault.jpg" class="infosection__img" alt="$Title">
				<% else_if $MainImage %>
					<img src="$MainImage.Pad(360,450).URL" width="180" height="150" class="infosection__img" alt="$Title">
				<% end_if %>
				<div class="infosection__body">
					<h3 class="infosection__title">$Title</h3>
					<p class="infosection__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<% end_loop %>
	</ul>
	<% end_with %>
</section>

<!-- End What We Do -->


<!-- Newsletter Sign Up -->
<section class="homepage-signup" aria-labelledby="newsletter__id">
	<div class="row">
		<div class="columns large-8 large-offset-2">
			<h2 class="show-for-sr" id="newsletter__id">Newsletter Signup</h2>
			<p class="homepage-signup__text">Sign up to receive emails from <strong><a href="https://afterclass.uiowa.edu/events/">After Class</a></strong> about upcoming events and news from the Division of Student Life.</p>

			<!-- Begin MailChimp Signup Form -->
			<link href="//cdn-images.mailchimp.com/embedcode/horizontal-slim-10_7.css" rel="stylesheet" type="text/css">
			<style type="text/css">
				#mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; width:100%;}
			</style>
			<div id="mc_embed_signup">
				<form action="https://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
					<div id="mc_embed_signup_scroll">
						<label for="mce-EMAIL">Subscribe to our mailing list</label>
						<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required>
						<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
						<div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_c61b1cddac92babd42d7d628e_8e3635391c" title="hidden field" tabindex="-1" value=""></div>
						<div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
					</div>
				</form>
			</div>
			<!--End mc_embed_signup-->
		</div>
	</div>
</section>
<!-- End Newsletter Signup


<!-- Spotlight Feature -->
<% if $SpotlightTitle || $SpotlightContent %>
<section class="spotlight" <% if $SpotlightImage %>data-interchange="[$SpotlightImage.FocusFill(800,600).URL, small], [$SpotlightImage.FocusFill(1300,500).URL, large]"<% end_if %> aria-labelledby="spotlight__id">
	<div class="column row">
		<div class="spotlight__container">
			<% if $SpotlightTitle %>
				<h3 class="spotlight__title" id="spotlight__id">$SpotlightTitle</h3>
			<% end_if %>
			<% if $SpotlightContent %>
				<div class="spotlight__content">
					$SpotlightContent
				</div>
			<% end_if %>
		</div>
	</div>
</section>
<% end_if %>
<!-- End Spotlight Feature -->


<!-- Departments -->
<section class="dept-container" aria-labelledby="dept__id">
	<div class="dept-slider">
		<div class="dept-slider__mast">
			<% if $DepartmentTitle %><h2 class="dept-slider__mast-title" id="dept__id">$DepartmentTitle</h2><% end_if %>
			<% if $DepartmentContent %><div class="dept-slider__mast-desc">$DepartmentContent</div><% end_if %>
			<a href="{$BaseHref}our-departments/" class="dept-slider__mast-btn">See All Departments</a>
		</div>
		<div class="dept-slider__gallery">
			<% if $AllDepartments %>
				<% loop $AllDepartments %>
					<div class="dept-slider__gallery-slide">
						<img src="{$ThemeDir}/dist/images/dosl.png" data-flickity-lazyload="$BackgroundImage.FocusFill(800,600).URL" class="dept-slider__gallery-img" alt="$Title">
						<div class="dept-slider__gallery-box">
							<div class="dept-slider__gallery-box-content">
								<h3 class="dept-slider__gallery-title">$Title</h3>
								<div class="dept-slider__gallery-desc"><p>$Content.FirstSentence.LimitCharacters(150)</p></div>
								<a href="$Link" class="dept-slider__gallery-btn">Learn More About $Title</a>
							</div>
						</div>
					</div>
				<% end_loop %>
			<% end_if %>
		</div>
	</div>
</section>
<!-- End Departments -->


<!-- Instagram Feed -->
<section class="instafeed" aria-labelledby="instagramid">
	<div class="row">
		<div class="columns">
			<h3 id="instagramid">Follow us on Instagram <a href="https://www.instagram.com/uistudentlife/">@uistudentlife</a></h3>
			<!-- LightWidget WIDGET --><script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script><iframe src="https://cdn.lightwidget.com/widgets/d42f1547dd2c56fb8ad082838075f620.html" scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width:100%;border:0;overflow:hidden;"></iframe>
		</div>
	</div>
</section>


