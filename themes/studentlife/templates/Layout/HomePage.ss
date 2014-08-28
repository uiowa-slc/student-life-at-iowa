<section class="upcoming-events clearfix">
	<div class="container">
		<h1 class="section-title">What's Happening</h1>
		<br>
		<ul class="unstyled justify justify-4">
		<% with Page("Calendar") %>
			<% loop $EventList.limit(4) %>
			<li class="justify-item">
				<% loop $Dates %>
				<p class="event-date"> $Format("F j") </p>
				<% end_loop %>
				<h2 class="event-title"><a href="$LocalistLink">$Title</a></h2>
				<div class="event-desc">
					$SummaryContent.BigSummary(30)
				</div>
			</li>
			<% end_loop %>
		<% end_with %>
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
					<div class="col-sm-4 form-group">
						<input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button btn btn-default btn-block">
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-xs-12 clearfix social-wrapper">
					<a href="https://www.facebook.com/uistudentlife" class="social-links"><span class="icon-facebook"></span> Facebook</a>&nbsp;
					<a href="https://twitter.com/uistudentlife" class="social-links"><span class="icon-twitter"></span> Twitter</a>
				</div>
			</div>
		</div>
		<!--End mc_embed_signup-->
	</div>
</section>

	<% loop Children %>
		$RenderedSection
	<% end_loop %>