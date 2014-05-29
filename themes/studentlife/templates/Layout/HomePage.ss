<section class="upcoming-events clearfix">
	<div class="container">
		<h1 class="section-title">What's Happening</h1>
		<br>
		<ul class="unstyled justify justify-4">
		<% loop RSSDisplay(4,"http://afterclass.uiowa.edu/events/feed/rss/") %>
			<li class="justify-item">
				<p class="event-date">$Dates</p>
				<h2 class="event-title"><a href="$Link">$Title</a></h2>
				<div class="event-desc">
					$Description.Summary(30)
				</div>
			</li>
			<% end_loop %>
			<li class="justify-item filler"></li>
			<li class="justify-item filler"></li>
		</ul>

		<!-- Begin MailChimp Signup Form -->
		<div id="mc_embed_signup" class="email-signup">
			<form action="http://uiowa.us2.list-manage.com/subscribe/post?u=c61b1cddac92babd42d7d628e&amp;id=8e3635391c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate form-inlines" role="form" target="_blank" novalidate>
				<h5>Subscribe to our mailing list</h5>
				<!-- <div class="form-group">
					<label class="sr-only" for="exampleInputEmail2">Email Address</label>
					<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email address">
				</div> -->
				<div class="row">
					<div class="mc-field-group form-group col-sm-8">
						<label for="mce-EMAIL" class="sr-only">Email Address  <span class="asterisk">*</span></label>
						<input type="email" value="" name="EMAIL" class="required email form-control" id="mce-EMAIL" placeholder="Enter email address">
					</div>
					<div id="mce-responses" class="clear">
						<div class="response" id="mce-error-response" style="display:none"></div>
						<div class="response" id="mce-success-response" style="display:none"></div>
					</div>
					<div style="position: absolute; left: -5000px;"><input type="text" name="b_c61b1cddac92babd42d7d628e_8e3635391c" tabindex="-1" value=""></div>
					<div class="col-sm-4">
						<input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button btn btn-default btn-block">
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-md-6">
					<span style="display:block;height:5px;"></span>
					<a href="https://twitter.com/imubuddy" class="twitter-follow-button" data-show-count="true" data-lang="en">Follow @twitterapi</a>
				</div>
				<div class="col-md-6">
					<div class="fb-like" data-href="https://www.facebook.com/uistudentlife" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
				</div>
			</div>
		</div>
		<!--End mc_embed_signup-->
	</div>
</section>

<!-- <div class="container">
	<div class="row clearfix" style="background-color: #ccc;">
		<div class="col-md-6">
			<div class="slider center">
				<div><h3>1</h3></div>
				<div><h3>2</h3></div>
				<div><h3>3</h3></div>
				<div><h3>4</h3></div>
				<div><h3>5</h3></div>
				<div><h3>6</h3></div>
			</div>
		</div>
	</div>
</div> -->

	<% loop Children %>
		$RenderedSection
	<% end_loop %>